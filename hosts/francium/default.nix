{ config, pkgs, ... }:

let
  hostname = "francium";
  domain = "armeen.org";
in
{
  imports = [ ./hardware-configuration.nix ];

  system.stateVersion = "21.05"; # Don't change

  boot = {
    loader = {
      grub.enable = true;
      grub.version = 2;
      grub.device = "/dev/vda";
    };
  };

  time.timeZone = "America/Denver";

  networking = {
    hostName = hostname;
    domain = domain;
    interfaces.ens3.useDHCP = true;

    firewall = {
      allowedTCPPorts = [ 22 80 443 18080 18089 ];
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  users.users.nixpower = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
  };

  environment = {
    systemPackages = with pkgs; [
      monero
      neovim
      wget
      git
      nodejs
      python3
      htop
      bottom
      fzf
      fasd
      tmux
      zsh
      nmap
      ldns
      fd
      ripgrep
      rxvt_unicode.terminfo
    ];

    variables.EDITOR = "nvim";
  };

  programs = {
    mtr.enable = true;
    zsh.enable = true;
    mosh.enable = true;

    neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;
    };
  };

  services = {
    openssh.enable = true;

    nginx = {
      enable = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      recommendedProxySettings = true;

      virtualHosts."aurum.${domain}" = {
        enableACME = true;
        forceSSL = true;
        locations."/".proxyPass = "http://[::1]:18089";
      };

      virtualHosts."natrium.${domain}" = {
        enableACME = true;
        forceSSL = true;

        locations."/".extraConfig = "return 404;";
        locations."/_matrix".proxyPass = "http://[::1]:8008";
      };
    };

    monero = {
      enable = true;
      dataDir = "/tank/monero";

      rpc = {
        address = "127.0.0.1";
        port = 18081;
      };

      extraConfig = ''
        rpc-restricted-bind-port=18089
        enforce-dns-checkpointing=1
        enable-dns-blocklist=1
        no-igd=1
        no-zmq=1
        public-node=1
      '';
    };

    postgresql = {
      enable = true;
      initialScript = pkgs.writeText "synapse-init.sql" ''
        CREATE ROLE "matrix-synapse" WITH LOGIN PASSWORD 'synapse';
        CREATE DATABASE "matrix-synapse" WITH OWNER "matrix-synapse"
          TEMPLATE template0
          LC_COLLATE = "C"
          LC_CTYPE = "C";
      '';
    };

    matrix-synapse = {
      enable = true;
      server_name = "natrium.${domain}";
      dataDir = "/tank/matrix";
      listeners = [
        {
          port = 8008;
          bind_address = "127.0.0.1";
          type = "http";
          tls = false;
          x_forwarded = true;
          resources = [
            {
              names = [ "client" "federation" ];
              compress = false;
            }
          ];
        }
      ];
    };
  };

  security.acme = {
    acceptTerms = true;
    email = "mahdianarmeen@gmail.com";
  };
}
