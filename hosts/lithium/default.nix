{ config, pkgs, lib, modulesPath, inputs, root, user, ... }:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/99E6-DA3E";
      fsType = "vfat";
    };

    "/" = {
      device = "/dev/disk/by-uuid/9d5b84ba-b19b-46ef-9514-d275cf305ddb";
      fsType = "ext4";
    };
  };

  boot = {
    initrd = {
      systemd = {
        enable = true;
        network.enable = true;
      };

      kernelModules = [ "amdgpu" ];
      includeDefaultModules = false;
      verbose = false;
    };

    lanzaboote = {
      enable = true;
      pkiBundle = "/etc/secureboot";
    };

    binfmt.emulatedSystems = [ "aarch64-linux" ];
    supportedFilesystems = [ "zfs" ];
    consoleLogLevel = 0;

    kernelModules = [
      "ib_umad"
      "ib_ipoib"
    ];

    kernelPackages = pkgs.callPackage ./kernel.nix { };

    kernelParams = [
      "elevator=none"
      "kvm.nx_huge_pages=force"
      "lsm=yama,apparmor,bpf"
      "quiet"
      "slub_debug=FZ"
      "udev.log_priority=3"
    ];

    kernel.sysctl = {
      # Needed for router
      "net.ipv4.conf.all.accept_redirects" = true;
      "net.ipv6.conf.all.accept_redirects" = true;
      "net.ipv4.conf.all.accept_source_route" = true;
      "net.ipv6.conf.all.accept_source_route" = true;
      "net.ipv4.ip_forward" = true;
      "net.ipv4.conf.all.send_redirects" = true;

      "net.ipv4.conf.all.secure_redirects" = true;
      "net.ipv6.conf.all.secure_redirects" = true;

      "net.ipv4.conf.all.log_martians" = true;
      "net.ipv4.conf.all.rp_filter" = true;

      "net.ipv4.icmp_echo_ignore_all" = false;
      "net.ipv4.icmp_echo_ignore_broadcasts" = true;
      "net.ipv4.icmp_ignore_bogus_error_responses" = true;

      "net.ipv4.tcp_congestion_control" = "bbr";
      "net.ipv4.tcp_dsack" = false;
      "net.ipv4.tcp_fack" = false;
      "net.ipv4.tcp_fastopen" = 3;
      "net.ipv4.tcp_rfc1337" = true;
      "net.ipv4.tcp_sack" = false;
      "net.ipv4.tcp_synack_retries" = 5;
      "net.ipv4.tcp_timestamps" = false;
      "net.ipv4.tcp_window_scaling" = true;

      "net.ipv6.conf.default.accept_ra" = false;
      "net.ipv6.conf.default.accept_ra_pinfo" = false;
      "net.ipv6.conf.default.accept_ra_rtr_pref" = false;
      "net.ipv6.conf.default.aceept_ra_defrtr" = false;
      "net.ipv6.conf.default.max_addresses" = 1;
      "net.ipv6.conf.default.router_solicitations" = false;

      "net.core.bpf_jit_harden" = 2;
      "net.core.default_qdisc" = "cake";
      "net.core.netdev_max_backlog" = 5000;
      "net.core.rmem_max" = 8388608;
      "net.core.wmem_max" = 8388608;

      "kernel.core_uses_pid" = true;
      "kernel.kptr_restrict" = 2;
      "kernel.panic_on_oops" = false;
      "kernel.perf_event_paranoid" = 3;
      "kernel.printk" = "3 3 3 3";
      "kernel.randomize_va_space" = 2;
      "kernel.unprivileged_bpf_disabled" = true;
      "kernel.yama.ptrace_scope" = 2;

      # Appropriate for x86
      "vm.max_map_count" = 1048576;
      "vm.mmap_rnd_bits" = 32;
      "vm.mmap_rnd_compat_bits" = 16;

      "user.max_user_namespaces" = 10000;

      "fs.protected_hardlinks" = true;
      "fs.protected_symlinks" = true;
      "fs.protected_fifos" = 2;
      "fs.protected_regular" = 2;
    };

    loader = {
      efi.canTouchEfiVariables = true;

      systemd-boot = {
        enable = lib.mkForce false; # NOTE: Conflicts with lanzaboote.
        editor = false;
      };
    };
  };

  networking = {
    hostId = "5a656e88";
    hostName = "lithium";

    useNetworkd = true;
    wireless.iwd.enable = true;

    firewall.interfaces.enp77s0.allowedTCPPorts = [ 8080 ];
  };

  hardware = {
    enableAllFirmware = true;

    bluetooth.enable = true;
    cpu.amd.updateMicrocode = true;
    rtl-sdr.enable = true;

    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        amdvlk
        rocm-opencl-icd
        rocm-opencl-runtime
      ];
      extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];
    };

    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      modesetting.enable = true;
    };

    sane = {
      enable = true;
      extraBackends = with pkgs; [
        sane-airscan
      ];
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "America/Los_Angeles";

  console = {
    keyMap = "us";
    font = "Tamsyn7x13r";
    packages = [ pkgs.tamsyn ];
    earlySetup = false;
  };

  nix = {
    package = pkgs.nixUnstable;
    channel.enable = true; # NOTE: We should try to get rid of this.
    nixPath = lib.mkForce [ "nixpkgs=${config.nix.registry.nixpkgs.flake}" ];

    registry = {
      nixpkgs.flake = inputs.nixpkgs;
    };

    settings = {
      allowed-users = lib.mkForce [ "@wheel" ];
      trusted-users = lib.mkForce [ "@wheel" ];
    };

    extraOptions = ''
      warn-dirty = false
      experimental-features = flakes nix-command ca-derivations
    '';
  };

  nixpkgs = {
    hostPlatform = "x86_64-linux";
  };

  services = {
    blueman.enable = true;
    flatpak.enable = true;
    fstrim.enable = true;
    haveged.enable = true;
    i2pd.enable = true;
    iperf3.enable = true;
    mozillavpn.enable = true;
    physlock.enable = true;
    saned.enable = true;
    smartd.enable = true;
    spice-vdagentd.enable = true;
    tcsd.enable = false;
    timesyncd.enable = true;
    udisks2.enable = true;
    fwupd.enable = true;

    avahi = {
      enable = true;
      nssmdns4 = true;
      nssmdns6 = true;
    };

    hardware = {
      bolt.enable = true;
      openrgb = {
        enable = true;
        package = pkgs.openrgb-with-all-plugins;
        motherboard = "amd";
      };
    };

    openssh = {
      enable = true;

      settings = {
        PasswordAuthentication = false;
      };
    };

    openvpn = {
      servers.foo = {
        autoStart = false;
        config = '' config /home/armeen/foo.ovpn '';
      };
    };

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    printing = {
      enable = true;
      drivers = with pkgs; [
        canon-cups-ufr2
        cnijfilter2
        gutenprint
        gutenprintBin
      ];
    };

    resolved = {
      enable = true;
      fallbackDns = lib.mkForce [];
      dnssec = "false";
    };

    tor = {
      enable = true;
      client.enable = true;
    };

    udev = {
      packages = with pkgs; [
        ledger-udev-rules
        platformio
        vial
        yubikey-personalization
      ];

      extraRules = ''
        ACTION=="add|change"                                                    \
        , KERNEL=="sd[a-z]*[0-9]*|mmcblk[0-9]*p[0-9]*|nvme[0-9]*n[0-9]*p[0-9]*" \
        , ENV{ID_FS_TYPE}=="zfs_member"                                         \
        , ATTR{../queue/scheduler}="none"
      '';
    };

    usbguard = {
      enable = false;
      rules = builtins.readFile ./conf/usbguard/rules.conf;
    };

    xserver.videoDrivers = [ "amdgpu" "nvidia" ];

    zfs = {
      trim.enable = true;
      autoScrub.enable = true;
      autoSnapshot.enable = true;
    };
  };

  systemd = {
    watchdog.rebootTime = "15s";

    tmpfiles.rules = [
      "d /var/srv 0755 - - -"
      "L /srv - - - - /var/srv"
    ];

    suppressedSystemUnits = [
      "sys-kernel-debug.mount"
    ];

    services.systemd-networkd-wait-online.enable = lib.mkForce false;
  };

  security = {
    allowUserNamespaces = true;
    protectKernelImage = true;
    unprivilegedUsernsClone = true;
    virtualisation.flushL1DataCache = null;

    apparmor.enable = true;
    auditd.enable = true;
    rtkit.enable = true;
    polkit.enable = true;
    sudo.enable = false;

    acme = {
      acceptTerms = true;
      defaults.email = user.email;
    };

    audit = {
      enable = false;
      rules = [ ];
    };

    doas = {
      enable = true;
      extraRules = [{
        groups = [ "wheel" ];
        keepEnv = true;
        noPass = false;
      }];
    };

    pam = {
      u2f.enable = true;
      services.swaylock = {};
    };

    tpm2 = {
      enable = true;
      abrmd.enable = true;
      pkcs11.enable = false; # XXX
      tctiEnvironment.enable = true;
    };

    pki.certificateFiles = [ "/srv/a.crt" ];
  };

  virtualisation = {
    spiceUSBRedirection.enable = true;
    waydroid.enable = true;

    libvirtd = {
      enable = false;
      qemu = {
        swtpm.enable = true;
        ovmf = {
          enable = true;
          package = (pkgs.OVMF.override {
            secureBoot = true;
            tpmSupport = true;
          });
        };
      };
    };

    docker = {
      enable = true;
      enableNvidia = true;
    };

    podman = {
      enable = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;

    users = {
      root.hashedPassword = null;

      "${user.login}" = {
        isNormalUser = true;
        hashedPasswordFile = config.sops.secrets."${user.login}-pw".path;
        extraGroups = [
          "adbusers"
          "docker"
          "i2c"
          "libvirtd"
          "lp"
          "plugdev"
          "scanner"
          "wheel"
        ];
      };
    };
  };

  #home-manager = {
#
  #};

  environment = {
    defaultPackages = lib.mkForce [ ];

    systemPackages = (with pkgs; [
      hdparm
      lm_sensors
      lshw
      opensm
      pciutils
      radeontop
      rdma-core
      sbctl
      smartmontools
      usbutils

      git
      rsync

      (hunspellWithDicts [ hunspellDicts.en_US hunspellDicts.en_US-large ])
    ]);

    etc = {
      openvpn.source = "${pkgs.update-resolv-conf}/libexec/openvpn";
    };
  };

  programs = {
    adb.enable = true;
    dconf.enable = true;
    hyprland.enable = true;
    mtr.enable = true;
    nix-ld.enable = true;
    openvpn3.enable = true;
    zsh.enable = true;

    custom.ddcutil = {
      enable = false;
      users = [ user.login ];
    };

    neovim = {
      enable = true;
      defaultEditor = true;
      configure = {
        customRC = ''
          set number
          set hidden
          set shell=bash
          set cmdheight=2
          set nocompatible
          set shortmess+=c
          set updatetime=300
          set background=dark
          set foldmethod=marker
          set signcolumn=yes
          set nobackup nowritebackup
          set tabstop=2 shiftwidth=2 expandtab
          set tagrelative
          set tags^=./.git/tags;
          set mouse=a
        '';
      };
    };

    update-systemd-resolved = {
      servers.foo = {
        includeAutomatically = true;
      };
    };
  };

  documentation = {
    dev.enable = true;
    man.generateCaches = true;
  };

  sops = {
    defaultSopsFile = "${root}/secrets/secrets.yaml";
    age.sshKeyPaths = [ "/etc/ssh/ssh_host_ed25519_key" ];

    secrets = {
      "${user.login}-pw".neededForUsers = true;
    };
  };

  zramSwap.enable = true;

  system = {
    stateVersion = lib.mkForce "22.11";

    activationScripts.report-changes = ''
        PATH=$PATH:${lib.makeBinPath [ pkgs.nvd pkgs.nix ]}
        nvd diff $(ls -dv /nix/var/nix/profiles/system-*-link | tail -2)
    '';
  };
}
