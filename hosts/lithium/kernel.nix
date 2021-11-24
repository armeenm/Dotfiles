{ config, pkgs, lib, ... }:

pkgs.linuxPackagesFor (pkgs.linux_5_14_hardened.override {
  structuredExtraConfig = with lib.kernel; {

    ## General ##
    #DEBUG_KMEMLEAK = yes;
    #PROVE_LOCKING = yes;
    #SCHED_STACK_END_CHECK = yes;
    ACCESSIBILITY = lib.mkForce no;
    AIO = lib.mkForce no;
    BIG_KEYS = yes;
    BINFMT_MISC = lib.mkForce no;
    BPF_SYSCALL = lib.mkForce no;
    BUG_ON_DATA_CORRUPTION = yes;
    COMPAT_BRK = no;
    COMPAT_VDSO = no;
    CONFIGFS_FS = yes;
    CONNECTOR = yes;
    COREDUMP = no;
    CRASH_DUMP = no;
    CRYPTO_CRYPTD = yes;
    CRYPTO_JITTERENTROPY = yes;
    DEBUG_ATOMIC_SLEEP = yes;
    DEBUG_CREDENTIALS = yes;
    DEBUG_NOTIFIERS = yes;
    DEBUG_PLIST = yes;
    DEBUG_SG = yes;
    DEBUG_VIRTUAL = yes;
    DEBUG_WX = yes;
    DEVMEM = no;
    DEVPORT = no;
    EFIVAR_FS = yes;
    EFI_DISABLE_PCI_DMA = no;
    EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER = lib.mkForce no;
    EFI_VARS = no;
    ENCRYPTED_KEYS = yes;
    EXPERT = yes;
    FORTIFY_SOURCE = yes;
    GCC_PLUGINS = yes;
    GCC_PLUGIN_LATENT_ENTROPY = yes;
    GCC_PLUGIN_RANDSTRUCT = yes;
    GCC_PLUGIN_STACKLEAK = yes;
    GCC_PLUGIN_STACKLEAK_METRICS = yes;
    GCC_PLUGIN_STRUCTLEAK_BYREF_ALL = yes;
    GPIOLIB = no;
    HARDENED_USERCOPY = yes;
    HARDENED_USERCOPY_FALLBACK = no;
    HARDENED_USERCOPY_PAGESPAN = no;
    HARDLOCKUP_DETECTOR = yes;
    HIBERNATION = no;
    INIT_ON_ALLOC_DEFAULT_ON = yes;
    INIT_ON_FREE_DEFAULT_ON = yes;
    KCSAN = yes;
    KEXEC = no;
    KEXEC_FILE = lib.mkForce no;
    KEYS = yes;
    KEY_DH_OPERATIONS = yes;
    KFENCE = yes;
    MAGIC_SYSRQ_DEFAULT_ENABLE = freeform "0x84";
    NLS_CODEPAGE_437 = lib.mkForce yes;
    NLS_ISO8859_1 = lib.mkForce yes;
    OVERLAY_FS = yes;
    PAGE_POISONING = no;
    PAGE_SANITIZE = yes;
    PAGE_SANITIZE_VERIFY = yes;
    PAGE_TABLE_ISOLATION = yes;
    PERSISTENT_KEYS = yes;
    PROC_KCORE = no;
    PROC_PAGE_MONITOR = no;
    PROFILING = no;
    PSTORE_COMPRESS_DEFAULT = freeform "zstd";
    PSTORE_DEFLATE_COMPRESS = yes;
    PSTORE_RAM = yes;
    PSTORE_ZSTD_COMPRESS = yes;
    RANDOMIZE_BASE = yes;
    RANDOMIZE_KSTACK_OFFSET_DEFAULT = yes;
    RANDOMIZE_MEMORY = yes;
    RANDOM_TRUST_BOOTLOADER = yes;
    RANDOM_TRUST_CPU = yes;
    RESET_ATTACK_MITIGATION = yes;
    SECURITY_DMESG_RESTRICT = yes;
    SECURITY_LOCKDOWN_LSM = no; # NOTE: depends on sigs
    SECURITY_NETWORK_XFRM = yes;
    SECURITY_PATH = yes;
    SECURITY_PERF_EVENTS_RESTRICT = yes;
    SECURITY_SELINUX_DISABLE = no;
    SECURITY_TIOCSTI_RESTIRCT = yes;
    SHUFFLE_PAGE_ALLOCATOR = yes;
    SLAB_FREELIST_HARDENED = yes;
    SLAB_FREELIST_RANDOM = yes;
    SLAB_MERGE_DEFAULT = no;
    SOFTLOCKUP_DETECTOR = yes;
    STACKPROTECTOR = yes;
    STACKPROTECTOR_STRONG = yes;
    STAGING = lib.mkForce no;
    SYSFS_SYSCALL = no;
    TLS = yes;
    TLS_DEVICE = yes;
    TRUSTED_KEYS = yes;
    UBSAN = no;
    UHID = no;
    UIO = no;
    USELIB = no;
    USERFAULTFD = lib.mkForce no;
    VMAP_STACK = yes;
    WQ_WATCHDOG = yes;
    ZRAM = module;
    ZRAM_DEF_COMP = freeform "zstd";
    ZSMALLOC = module;
    ZSMALLOC_STAT = yes;
    CRYPTO_CMAC = yes;

    ## X86_64 ##
    DEFAULT_MMAP_MIN_ADDR = freeform "65536";
    IA32_EMULATION = no;
    LEGACY_VSYSCALL_NONE = yes;
    MODIFY_LDT_SYSCALL = no;
    X86_INTEL_UMIP = yes;
    X86_64 = yes;
    X86_CPUID = yes;
    X86_IOPL_IOPERM = no;
    X86_MCE_INJECT = no;
    X86_MSR = yes;
    X86_X32 = no;

    ## Hardware ##
    ACPI_APEI = yes;
    ACPI_APEI_GHES = yes;
    ACPI_APEI_PCIEAER = yes;
    ACPI_BUTTON = yes;
    ACPI_FPDT = yes;
    ACPI_PROCESSOR_AGGREGATOR = yes;
    ACPI_TAD = yes;
    ACPI_WMI = yes;
    AMD_IOMMU = yes;
    AMD_IOMMU_V2 = yes;
    AMD_MEM_ENCRYPT = yes;
    AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT = yes;
    AMD_SFH_HID = yes;
    ATA = yes;
    BT = yes;
    BT_BNEP = yes;
    BT_HCIBTUSB = yes;
    BT_INTEL = yes;
    BT_RFCOMM = yes;
    CFG80211 = yes;
    CRC32C_INTEL = yes;
    CRYPTO_AES_NI_INTEL = yes;
    GIGABYTE_WMI = yes;
    HW_RANDOM = yes;
    HW_RANDOM_AMD = yes;
    HW_RANDOM_TPM = yes;
    IGB = yes;
    IWLWIFI = module;
    KVM = yes;
    KVM_AMD = yes;
    LEDS_BRIGHTNESS_HW_CHANGED = yes;
    LEDS_CLASS = yes;
    LEDS_CLASS_FLASH = yes;
    LEDS_CLASS_MULTICOLOR = yes;
    NET_VENDOR_REALTEK = yes;
    PERF_EVENTS_AMD_POWER = yes;
    PERF_EVENTS_INTEL_CSTATE = yes;
    PERF_EVENTS_INTEL_RAPL = yes;
    PERF_EVENTS_INTEL_UNCORE = yes;
    PHYLIB = yes;
    PINCTRL_AMD = yes;
    R8169 = yes;
    RTC_DRV_CMOS = yes;
    SENSORS_CORETEMP = yes;
    SENSORS_CORSAIR_PSU = module;
    SENSORS_K10TEMP = yes;
    SP5100_TCO = yes;
    TCG_TIS = yes;
    TEE = yes;
    TPM_CRB = yes;
    WMI_BMOF = yes;
    X86_5LEVEL = no;
    X86_ACPI_CPUFREQ = yes;

    ## Media ##
    SND = yes;
    SND_JACK = yes;
    SND_OSSEMUL = yes;
    SND_PCM_OSS = no;
    SOUND = yes;
    SUPPORT_OLD_API = no;

    ## I/O ##
    BACKLIGHT_CLASS_DEVICE = yes;
    HID = yes;
    HID_ACCUTOUCH = yes;
    HID_APPLE = yes;
    HID_BELKIN = yes;
    HID_CHERRY = yes;
    HID_CHICONY = yes;
    HID_CORSAIR = yes;
    HID_CP2112 = yes;
    HID_FT260 = yes;
    HID_GENERIC = yes;
    HID_GLORIOUS = yes;
    HID_JABRA = yes;
    HID_KENSINGTON = yes;
    HID_LENOVO = yes;
    HID_LOGITECH = yes;
    HID_LOGITECH_DJ = yes;
    HID_LOGITECH_HIDPP = yes;
    HID_MAGICMOUSE = yes;
    HID_MAYFLASH = yes;
    HID_MICROSOFT = yes;
    HID_ORTEK = yes;
    HID_PLANTRONICS = yes;
    HID_SENSOR_CUSTOM_SENSOR = yes;
    HID_SENSOR_HUB = yes;
    HID_STEAM = yes;
    HID_STEELSERIES = yes;
    HID_WACOM = yes;
    I2C = yes;
    I2C_CHARDEV = yes;
    I2C_MUX = yes;
    INPUT_EVDEV = yes;
    MEDIA_CAMERA_SUPPORT = yes;
    MEDIA_USB_SUPPORT = yes;
    PCIEAER = yes;
    PCIE_PTM = yes;
    PCI_PF_STUB = yes;
    PCI_REALLOC_ENABLE_AUTO = yes;
    PCI_STUB = yes;
    TYPEC = yes;
    USB = yes;
    USB_EHCI_FSL = yes;
    USB_EHCI_HCD = yes;
    USB_EHCI_PCI = yes;
    USB_HID = yes;
    USB_OHCI_HCD = yes;
    USB_OHCI_HCD_PLATFORM = yes;
    USB_OHCI_PCI = yes;
    USB_PRINTER = yes;
    USB_UHCI_HCD = yes;
    USB_XHCI_HCD = yes;
    USB_XHCI_PCI_RENESAS = yes;
    USB_XHCI_PLATFORM = yes;

    ## Networking ##
    DEFAULT_TCP_CONG = freeform "bbr";
    HOSTAP = no;
    INET6_AH = yes;
    INET6_ESP = yes;
    INET6_ESPINTCP = no;
    INET6_ESP_OFFLOAD = yes;
    INET6_IPCOMP = yes;
    INET6_XFRM_TUNNEL = yes;
    INET_AH = yes;
    INET_DIAG = yes; # NOTE
    INET_ESP = yes;
    INET_ESPINTCP = no;
    INET_ESP_OFFLOAD = yes;
    INET_IPCOMP = yes;
    INET_RAW_DIAG = yes;
    INET_UDP_DIAG = yes;
    IPV6_FOU = yes;
    IPV6_FOU_TUNNEL = lib.mkForce yes;
    IPV6_GRE = yes;
    IPV6_ILA = yes;
    IPV6_TUNNEL = yes;
    IPV6_VTI = yes;
    IPVLAN = yes;
    IPVTAP = yes;
    MACVLAN = yes;
    MACVTAP = yes;
    NETFILTER_NETLINK = yes;
    NETFILTER_NETLINK_ACCT = yes;
    NETFILTER_NETLINK_HOOK = no;
    NETFILTER_NETLINK_LOG = yes;
    NETFILTER_NETLINK_OSF = yes;
    NETFILTER_NETLINK_QUEUE = yes;
    NETLINK_DIAG = yes;
    NET_9P = module;
    NET_FOU = yes;
    NET_IPGRE = yes;
    NET_IPGRE_DEMUX = yes;
    NET_IPVTI = yes;
    NF_CONNTRACK = yes;
    PACKET = yes;
    PACKET_DIAG = yes;
    RFKILL = yes;
    SYN_COOKIES = yes;
    TCG_TPM = yes;
    TCP_CONG_BBR = yes;
    TCP_CONG_CUBIC = yes;
    TUN = yes;
    UNIX_DIAG = yes;
    VLAN_8021Q = yes;
    WIREGUARD = yes;
    XFRM_ESP = yes;
    XFRM_INTERFACE = no;
    XFRM_MIGRATE = no;
    XFRM_STATISTICS = yes;
    XFRM_SUB_POLICY = yes;
    XFRM_USER = yes;
    BRIDGE = yes;

    ## Storage ##
    AUTOFS_FS = yes;
    BLK_DEV_BSG = yes;
    BLK_DEV_DM = yes;
    BLK_DEV_LOOP = yes;
    BLK_DEV_NVME = yes;
    BLK_DEV_SD = yes;
    BLK_DEV_SR = yes;
    BTRFS_FS = yes;
    CACHEFILES = yes;
    CUSE = yes;
    DAX = yes;
    DM_BUFIO = yes;
    DM_CRYPT = yes;
    DM_FLAKEY = yes;
    DM_RAID = yes;
    DM_SNAPSHOT = yes;
    DM_VERITY = yes;
    ECRYPT_FS = yes;
    ECRYPT_FS_MESSAGING = yes;
    EXFAT_FS = yes;
    EXT2_FS = yes;
    EXT3_FS = yes;
    EXT4_FS = yes;
    FAT_FS = yes;
    FSCACHE = yes;
    FS_ENCRYPTION_ALGS = yes;
    FS_MBCACHE = yes;
    FUSE_FS = yes;
    ISO9660_FS = yes;
    JBD2 = yes;
    MMC = yes;
    MMC_BLOCK = yes;
    NETWORK_FILESYSTEMS = no;
    NVME_CORE = yes;
    QFMT_v2 = yes;
    SATA_AHCI = yes;
    SATA_AHCI_PLATFORM = yes;
    SCSI = yes;
    SCSI_CONSTANTS = yes;
    SCSI_LOGGING = yes;
    SCSI_SCAN_ASYNC = yes;
    SQUASHFS = yes;
    VFAT_FS = yes;
    XFS_FS = yes;

    ## Unused ##
    "60XX_WDT" = no;
    "6LOWPAN" = no;
    "8139CP" = no;
    "8139TOO" = no;
    "8139TOO_8129" = lib.mkForce no;
    ACENIC = no;
    ACERHDF = no;
    ACER_WIRELESS = no;
    ACER_WMI = no;
    ACPI_AC = no;
    ACPI_BATTERY = no;
    ACPI_CMPC = no;
    ACPI_CPPC_LIB = no;
    ACPI_DOCK = no;
    ACPI_EC_DEBUGFS = no;
    ACPI_FAN = no;
    ACPI_IPMI = no;
    ACPI_NFIT = no;
    ACPI_NUMA = no;
    ACPI_SBS = no;
    ACPI_TABLE_UPGRADE = no;
    ACPI_TINY_POWER_BUTTON = no;
    ACPI_VIDEO = no;
    ACQUIRE_WDT = no;
    AD525X_DPOT = no;
    ADAPTEC_STARFIRE = no;
    ADFS_FS = no;
    ADIN_PHY = no;
    ADVANTECH_WDT = no;
    ADV_SWBUTTON = no;
    AFFS_FS = no;
    AF_KCM = no;
    AF_RXRPC = no;
    ALIENWARE_WMI = no;
    ALIM1535_WDT = no;
    ALIM7101_WDT = no;
    ALTERA_MBOX = no;
    ALTERA_MSGDMA = no;
    ALTERA_TSE = no;
    ALX = no;
    AMD8111_ETH = no;
    AMD_PHY = no;
    AMD_PMC = no;
    AMD_XGBE = no;
    AMD_XGBE_HAVE_ECC = no;
    ANDROID = no;
    APDS9802ALS = no;
    APPLE_GMUX = no;
    APPLE_MFI_FASTCHARGE = no;
    APPLE_PROPERTIES = no;
    AQTION = no;
    AQUANTIA_PHY = no;
    ARCNET = no;
    ASUS_LAPTOP = no;
    ASUS_WIRELESS = no;
    AT803X_PHY = no;
    ATALK = no;
    ATA_OVER_ETH = no;
    ATA_SFF = no;
    ATH11K_PCI = no;
    ATL1 = no;
    ATL1C = no;
    ATL1E = no;
    ATL2 = no;
    ATM = no;
    AUTOFS4_FS = no;
    AUXDISPLAY = lib.mkForce no;
    AX88796B_PHY = no;
    B43 = no;
    B43LEGACY = no;
    B44 = no;
    BATMAN_ADV = no;
    BATTERY_DS2780 = no;
    BATTERY_DS2781 = no;
    BCM54140_PHY = no;
    BCM7XXX_PHY = no;
    BCM84881_PHY = no;
    BCM87XX_PHY = no;
    BCMA = no;
    BCMGENET = no;
    BCM_NET_PHYLIB = no;
    BE2ISCSI = no;
    BE2NET = no;
    BE2NET_BE2 = no;
    BE2NET_BE3 = no;
    BE2NET_HWMON = no;
    BE2NET_LANCER = no;
    BE2NET_SKYHAWK = no;
    BEFS_FS = no;
    BFS_FS = no;
    BLK_DEV_3W_XXXX_RAID = no;
    BLK_DEV_CRYPTOLOOP = no;
    BLK_DEV_DRBD = no;
    BLK_DEV_NBD = no;
    BLK_DEV_PCIESSD_MTIP32XX = no;
    BLK_DEV_RAM = no;
    BLK_DEV_RBD = no;
    BLK_DEV_RSXX = no;
    BLK_DEV_SX8 = no;
    BNA = no;
    BNX2 = no;
    BNX2X = no;
    BNX2X_SRIOV = no;
    BNXT = no;
    BNXT_FLOWER_OFFLOAD = no;
    BNXT_HWMON = no;
    BNXT_SRIOV = no;
    BRIDGE_NETFILTER = no;
    BROADCOM_PHY = no;
    BT_BCM = no;
    BT_HCIUART = lib.mkForce no;
    BT_MRVL = no;
    BT_RTL = no;
    CADENCE_WATCHDOG = no;
    CAIF = no;
    CAN = no;
    CASSINI = no;
    CAVIUM_PTP = no;
    CB710_CORE = no;
    CDROM_PKTCDVD = no;
    CEPH_LIB = no;
    CHELSIO_INLINE_CRYPTO = no;
    CHELSIO_IPSEC_INLINE = no;
    CHELSIO_T1 = no;
    CHELSIO_T3 = no;
    CHELSIO_T4 = no;
    CHELSIO_T4VF = no;
    CHELSIO_TLS_DEVICE = no;
    CHROME_PLATFORMS = lib.mkForce no;
    CHR_DEV_SCH = no;
    CHR_DEV_SG = no;
    CHR_DEV_ST = no;
    CICADA_PHY = no;
    CNIC = no;
    COMEDI = no;
    COMMON_CLK = no;
    COMPAL_LAPTOP = no;
    CORSAIR_CPRO = no;
    CORTINA_PHY = no;
    CPU5_WDT = no;
    CRAMFS = no;
    CRYPTO_AES_TI = no;
    CXL_BUS = no;
    CX_ECAT = no;
    CYPRESS_FIRMWARE = no;
    DA9062_WATCHDOG = no;
    DA9063_WATCHDOG = no;
    DAVICOM_PHY = no;
    DCDBAS = no;
    DE2104X = no;
    DE4X5 = no;
    DECNET = no;
    DEFXX = no;
    DELL_RBTN = no;
    DELL_RBU = no;
    DELL_SMBIOS = no;
    DELL_WMI = no;
    DELL_WMI_AIO = no;
    DELL_WMI_DESCRIPTOR = no;
    DELL_WMI_LED = no;
    DELL_WMI_SYSMAN = no;
    DL2K = no;
    DLM = no;
    DM9102 = no;
    DMABUF_SELFTESTS = no;
    DMATEST = no;
    DMA_ENGINE = no;
    DNET = no;
    DNOTIFY = no;
    DNS_RESOLVER = no;
    DP83822_PHY = no;
    DP83848_PHY = no;
    DP83867_PHY = no;
    DP83869_PHY = no;
    DP83TC811_PHY = no;
    DRM_AMDGPU = no;
    DRM_AMD_DC = no;
    DRM_GMA500 = lib.mkForce no;
    DRM_GUD = no;
    DRM_I810 = no;
    DRM_I830 = no;
    DRM_I915 = no;
    DRM_MGA = no;
    DRM_NOUVEAU = no;
    DRM_R128 = no;
    DRM_RADEON = no;
    DRM_SAVAGE = no;
    DRM_SIS = no;
    DRM_TDFX = no;
    DRM_VGEM = no;
    DRM_VIA = no;
    DUMMY = no;
    DUMMY_IRQ = no;
    DVB_CORE = no;
    DWC_XLGMAC = no;
    DWC_XLGMAC_PCI = no;
    DWMAC_GENERIC = no;
    DWMAC_INTEL = no;
    DWMAC_LOONGSON = no;
    DW_WATCHDOG = no;
    E100 = no;
    E1000 = no;
    E1000E = no;
    E1000E_HWTS = no;
    EBC_C384_WDT = no;
    EDAC = no;
    EDAC_SUPPORT = no;
    EEPROM_LEGACY = no;
    EFS_FS = no;
    EISA = no;
    ENA_ETHERNET = no;
    ENC28J60 = no;
    ENCLOSURE_SERVICES = no;
    ENCX24J600 = no;
    ENIC = no;
    EPIC100 = no;
    EQUALIZER = no;
    EROFS_FS = no;
    ET131X = no;
    ETHOC = no;
    EUROTECH_WDT = no;
    EXOFS_FS = no;
    F2FS_FS = lib.mkForce no;
    F71808E_WDT = no;
    FB_BACKLIGHT = no;
    FDDI = no;
    FDOMAIN_ISA = no;
    FDOMAIN_PCI = no;
    FEALNX = no;
    FIREWIRE = no;
    FIREWIRE_NOSY = no;
    FIXED_PHY = no;
    FM10K = no;
    FORCEDETH = no;
    FPGA = no;
    FUJITSU_ES = no;
    FUJITSU_LAPTOP = no;
    FUJITSU_TABLET = no;
    FUSION = lib.mkForce no;
    FW_ATTR_CLASS = no;
    GFS2_FS = no;
    GNSS = no;
    GPD_POCKET_FAN = no;
    GPIO_CDEV_V1 = no;
    GPIO_SYSFS = no;
    GREYBUS = no;
    GVE = no;
    HAMACHI = no;
    HAPPYMEAL = no;
    HFSPLUS_FS = no;
    HFS_FS = no;
    HID_A4TECH = no;
    HID_ACRUX = no;
    HID_ALPS = no;
    HID_APPLEIR = no;
    HID_ASUS = no;
    HID_AUREAL = no;
    HID_BETOP_FF = no;
    HID_BIGBEN_FF = no;
    HID_CMEDIA = no;
    HID_COUGAR = no;
    HID_CREATIVE_SB0540 = no;
    HID_CYPRESS = no;
    HID_DRAGONRISE = no;
    HID_ELAN = no;
    HID_ELECOM = no;
    HID_ELO = no;
    HID_EMS_FF = no;
    HID_EZKEY = no;
    HID_GEMBIRD = no;
    HID_GFRM = no;
    HID_GOOGLE_HAMMER = no;
    HID_GREENASIA = no;
    HID_GT683R = no;
    HID_GYRATION = no;
    HID_HOLTEK = no;
    HID_HYPERV_MOUSE = no;
    HID_ICADE = no;
    HID_ITE = no;
    HID_KEYTOUCH = no;
    HID_KYE = no;
    HID_LCPOWER = no;
    HID_LED = no;
    HID_MALTRON = no;
    HID_MCP2221 = no;
    HID_MONTEREY = no;
    HID_MULTITOUCH = no;
    HID_NTI = no;
    HID_NTRIG = no;
    HID_PANTHERLORD = no;
    HID_PENMOUNT = no;
    HID_PETALYNX = no;
    HID_PICOLCD = no;
    HID_PLAYSTATION = no;
    HID_PRIMAX = no;
    HID_REDRAGON = no;
    HID_RETRODE = no;
    HID_RMI = no;
    HID_RMI4 = no;
    HID_ROCCAT = no;
    HID_SAITEK = no;
    HID_SAMSUNG = no;
    HID_SEMITEK = no;
    HID_SMARTJOYPLUS = no;
    HID_SONY = no;
    HID_SPEEDLINK = no;
    HID_SUNPLUS = no;
    HID_THINGM = no;
    HID_THRUSTMASTER = no;
    HID_TIVO = no;
    HID_TOPSEED = no;
    HID_TWINHAN = no;
    HID_U2FZERO = no;
    HID_UCLOGIC = no;
    HID_UDRAW_PS3 = no;
    HID_VIEWSONIC = no;
    HID_VIVALDI = no;
    HID_WALTOP = no;
    HID_WIIMOTE = no;
    HID_XINMO = no;
    HID_ZEROPLUS = no;
    HID_ZYDACRON = no;
    HINIC = no;
    HIPPI = lib.mkForce no;
    HOTPLUG_PCI = no;
    HOTPLUG_PCI_PCIE = lib.mkForce no;
    HPFS_FS = no;
    HP_ILO = no;
    HP_WATCHDOG = no;
    HP_WMI = no;
    HSR = no;
    HW_RANDOM_INTEL = no;
    HYPERV = no;
    HYPERV_STORAGE = no;
    I2C_GPIO = no;
    I2C_HID_ACPI = no;
    I2C_HID_CORE = no;
    I2C_MULTI_INSTANTIATE = no;
    I2C_PIIX4 = no;
    I2C_TAOS_EVM = no;
    I40E = no;
    I40EVF = no;
    I6300ESB_WDT = no;
    I8K = no;
    IAVF = no;
    IB700_WDT = no;
    IBMASR = no;
    IBM_ASM = no;
    IBM_RTL = no;
    ICE = no;
    ICPLUS_PHY = no;
    ICS932S401 = no;
    IE6XX_WDT = no;
    IEEE802154 = no;
    IGBVF = no;
    IGB_DCA = no;
    IGB_HWMON = no;
    IGC = no;
    IIO = no;
    INFINIBAND = no;
    INPUT_88PM80X_ONKEY = no;
    INPUT_AD714X = no;
    INPUT_AD714X_I2C = no;
    INPUT_AD714X_SPI = no;
    INPUT_ADXL34X = no;
    INPUT_ADXL34X_I2C = no;
    INPUT_ADXL34X_SPI = no;
    INPUT_APANEL = no;
    INPUT_ATC260X_ONKEY = no;
    INPUT_ATI_REMOTE2 = no;
    INPUT_ATLAS_BTNS = no;
    INPUT_AXP20X_PEK = no;
    INPUT_BMA150 = no;
    INPUT_CM109 = no;
    INPUT_CMA3000 = no;
    INPUT_CMA3000_I2C = no;
    INPUT_DA7280_HAPTICS = no;
    INPUT_DA9063_ONKEY = no;
    INPUT_DRV260X_HAPTICS = no;
    INPUT_DRV2665_HAPTICS = no;
    INPUT_DRV2667_HAPTICS = no;
    INPUT_E3X0_BUTTON = no;
    INPUT_EVBUG = no;
    INPUT_GPIO_BEEPER = no;
    INPUT_GPIO_DECODER = no;
    INPUT_GPIO_ROTARY_ENCODER = no;
    INPUT_GPIO_VIBRA = no;
    INPUT_IDEAPAD_SLIDEBAR = no;
    INPUT_IMS_PCU = no;
    INPUT_IQS269A = no;
    INPUT_IQS626A = no;
    INPUT_JOYSTICK = no;
    INPUT_KEYBOARD = no;
    INPUT_KEYSPAN_REMOTE = no;
    INPUT_KXTJ9 = no;
    INPUT_MAX77693_HAPTIC = no;
    INPUT_MC13783_PWRBUTTON = no;
    INPUT_MISC = no;
    INPUT_MMA8450 = no;
    INPUT_MOUSE = no;
    INPUT_PCF50633_PMU = no;
    INPUT_PCF8574 = no;
    INPUT_PCSPKR = no;
    INPUT_POWERMATE = no;
    INPUT_PWM_BEEPER = no;
    INPUT_PWM_VIBRA = no;
    INPUT_RAVE_SP_PWRBUTTON = no;
    INPUT_REGULATOR_HAPTIC = no;
    INPUT_RETU_PWRBUTTON = no;
    INPUT_SOC_BUTTON_ARRAY = no;
    INPUT_TABLET = no;
    INPUT_TOUCHSCREEN = no;
    INPUT_UINPUT = no;
    INPUT_YEALINK = no;
    INT340X_THERMAL = no;
    INTEL_ATOMISP2_LED = no;
    INTEL_ATOMISP2_PM = no;
    INTEL_BXTWC_PMIC_TMU = no;
    INTEL_CHTDC_TI_PWRBTN = no;
    INTEL_HID_EVENT = no;
    INTEL_IDMA64 = no;
    INTEL_INT0002_VGPIO = no;
    INTEL_IOMMU = no;
    INTEL_IPS = no;
    INTEL_ISH_HID = no;
    INTEL_MEI_WDT = no;
    INTEL_MENLOW = no;
    INTEL_MRFLD_PWRBTN = no;
    INTEL_OAKTRAIL = no;
    INTEL_RST = no;
    INTEL_SKL_INT3472 = no;
    INTEL_SMARTCONNECT = no;
    INTEL_SPEED_SELECT_INTERFACE = no;
    INTEL_TH = no;
    INTEL_TXT = no;
    INTEL_VBTN = no;
    INTEL_WMI_SBL_FW_UPDATE = no;
    INTEL_WMI_THUNDERBOLT = no;
    INTEL_XWAY_PHY = no;
    IONIC = no;
    IPACK_BUS = no;
    IPV6_MIP6 = no;
    IPV6_SIT = no;
    IP_DCCP = no;
    IP_MROUTE = no;
    IP_PIMSM_V1 = yes;
    IP_PIMSM_V2 = no;
    IP_SCTP = no;
    IP_VS = no;
    ISA_BUS = no;
    ISCSI_BOOT_SYSFS = no;
    ISCSI_IBFT = no;
    ISCSI_TCP = no;
    ISL29003 = no;
    ISL29020 = no;
    IT8712F_WDT = no;
    IT87_WDT = no;
    ITCO_WDT = no;
    IXGB = no;
    IXGBE = no;
    IXGBEVF = no;
    IXGBEVF_IPSEC = no;
    IXGBE_DCA = no;
    IXGBE_HWMON = no;
    IXGBE_IPSEC = no;
    JFFS2_FS = no;
    JFS_FS = no;
    JME = no;
    KEMPLD_WDT = no;
    KS8842 = no;
    KS8851 = no;
    KS8851_MLL = no;
    KSZ884X_PCI = no;
    KUNIT = no;
    L2TP = no;
    LAN743X = no;
    LAPB = no;
    LCD_CLASS_DEVICE = no;
    LDISC_AUTOLOAD = no;
    LEGACY_PTYS = no;
    LG_LAPTOP = no;
    LIBERTAS = no;
    LIBFC = no;
    LIBFCOE = no;
    LIBNVDIMM = no;
    LIQUIDIO = no;
    LIQUIDIO_VF = no;
    LLC2 = no;
    LOGIRUMBLEPAD2_FF = lib.mkForce no;
    LOGITECH_FF = no;
    LOGIWHEELS_FF = no;
    LSI_ET1011C_PHY = no;
    LXT_PHY = no;
    MACB = no;
    MACB_PCI = no;
    MACB_USE_HWSTAMP = no;
    MACHZ_WDT = no;
    MACINTOSH_DRIVERS = no;
    MARVELL_10G_PHY = no;
    MARVELL_88X2222_PHY = no;
    MARVELL_PHY = no;
    MAX63XX_WATCHDOG = no;
    MDIO_BCM_UNIMAC = no;
    MDIO_BITBANG = no;
    MDIO_CAVIUM = no;
    MDIO_GPIO = no;
    MDIO_I2C = no;
    MDIO_MSCC_MIIM = no;
    MDIO_MVUSB = no;
    MDIO_THUNDER = no;
    MEDIATEK_GE_PHY = no;
    MEDIA_ANALOG_TV_SUPPORT = lib.mkForce no;
    MEDIA_DIGITAL_TV_SUPPORT = lib.mkForce no;
    MEGARAID_NEWGEN = lib.mkForce no;
    MEMSTICK = no;
    MENF21BMC_WATCHDOG = no;
    MENZ069_WATCHDOG = no;
    MEN_A21_WDT = no;
    MHI_BUS = no;
    MICREL_KS8995MA = no;
    MICREL_PHY = no;
    MICROCHIP_PHY = no;
    MICROCHIP_T1_PHY = no;
    MICROSEMI_PHY = no;
    MINIX_FS = no;
    MLX4_CORE = no;
    MLX4_CORE_GEN2 = no;
    MLX4_DEBUG = no;
    MLX4_EN = no;
    MLX5_CORE = no;
    MLXFW = no;
    MLXSW_CORE = no;
    MLX_PLATFORM = no;
    MMC_CB710 = no;
    MMC_SDHCI = no;
    MMC_TIFM_SD = no;
    MOTORCOMM_PHY = no;
    MPLS = no;
    MSDOS_FS = no;
    MSI_WMI = no;
    MTD = no;
    MVMDIO = no;
    MXM_WMI = no;
    MYRI10GE = no;
    MYRI10GE_DCA = no;
    NATIONAL_PHY = no;
    NATSEMI = no;
    NE2K_PCI = no;
    NETFS_SUPPORT = no;
    NETXEN_NIC = no;
    NET_DSA = no;
    NET_FC = lib.mkForce no;
    NET_IPIP = no;
    NET_L3_MASTER_DEV = lib.mkForce no;
    NET_NSH = no;
    NET_PKTGEN = no;
    NET_SB1000 = no;
    NET_SCHED = lib.mkForce no;
    NET_SWITCHDEV = no;
    NET_TULIP = no;
    NET_VENDOR_3COM = no;
    NET_VENDOR_8390 = no;
    NET_VENDOR_ADAPTEC = no;
    NET_VENDOR_AGERE = no;
    NET_VENDOR_ALACRITECH = no;
    NET_VENDOR_ALTEON = no;
    NET_VENDOR_AMAZON = no;
    NET_VENDOR_AMD = no;
    NET_VENDOR_AQUANTIA = no;
    NET_VENDOR_ARC = no;
    NET_VENDOR_ATHEROS = no;
    NET_VENDOR_BROADCOM = no;
    NET_VENDOR_BROCADE = no;
    NET_VENDOR_CADENCE = no;
    NET_VENDOR_CAVIUM = no;
    NET_VENDOR_CHELSIO = no;
    NET_VENDOR_CISCO = no;
    NET_VENDOR_CORTINA = no;
    NET_VENDOR_DEC = no;
    NET_VENDOR_DLINK = no;
    NET_VENDOR_EMULEX = no;
    NET_VENDOR_EZCHIP = no;
    NET_VENDOR_GOOGLE = no;
    NET_VENDOR_HUAWEI = no;
    NET_VENDOR_I825XX = no;
    NET_VENDOR_INTEL = no;
    NET_VENDOR_MARVELL = no;
    NET_VENDOR_MELLANOX = no;
    NET_VENDOR_MICREL = no;
    NET_VENDOR_MICROCHIP = no;
    NET_VENDOR_MICROSEMI = no;
    NET_VENDOR_MICROSOFT = no;
    NET_VENDOR_MYRI = no;
    NET_VENDOR_NATSEMI = no;
    NET_VENDOR_NETERION = no;
    NET_VENDOR_NETRONOME = no;
    NET_VENDOR_NI = no;
    NET_VENDOR_NVIDIA = no;
    NET_VENDOR_OKI = no;
    NET_VENDOR_PACKET_ENGINES = no;
    NET_VENDOR_PENSANDO = no;
    NET_VENDOR_QLOGIC = no;
    NET_VENDOR_QUALCOMM = no;
    NET_VENDOR_RDC = no;
    NET_VENDOR_RENESAS = no;
    NET_VENDOR_ROCKER = no;
    NET_VENDOR_SAMSUNG = no;
    NET_VENDOR_SEEQ = no;
    NET_VENDOR_SILAN = no;
    NET_VENDOR_SIS = no;
    NET_VENDOR_SMSC = no;
    NET_VENDOR_SOCIONEXT = no;
    NET_VENDOR_SOLARFLARE = no;
    NET_VENDOR_STMICRO = no;
    NET_VENDOR_SUN = no;
    NET_VENDOR_SYNOPSYS = no;
    NET_VENDOR_TEHUTI = no;
    NET_VENDOR_TI = no;
    NET_VENDOR_VIA = no;
    NET_VENDOR_WIZNET = no;
    NET_VENDOR_XILINX = no;
    NFC = no;
    NFP = no;
    NI903X_WDT = no;
    NIC7018_WDT = no;
    NILFS2_FS = no;
    NIU = no;
    NI_XGE_MANAGEMENT_ENET = no;
    NS83820 = no;
    NTB = no;
    NTFS_FS = no; # NOTE: Consider enabling in 5.15+
    NVME_FC = no;
    NVME_TARGET = no;
    NVME_TCP = no;
    NV_TCO = no;
    NXP_C45_TJA11XX_PHY = no;
    NXP_TJA11XX_PHY = no;
    OCFS2_FS = no;
    OMFS_FS = no;
    OPENVSWITCH = no;
    ORANGEFS_FS = no;
    PANASONIC_LAPTOP = no;
    PARPORT = no;
    PC87413_WDT = no;
    PCCARD = no;
    PCIE_DPC = no;
    PCIPCWATCHDOG = no;
    PCI_HYPERV = no;
    PCI_MESON = no;
    PCI_SW_SWITCHTEC = no;
    PCMCIA = no;
    PCNET32 = no;
    PCS_XPCS = no;
    PDC_ADMA = no;
    PEAQ_WMI = no;
    PHANTOM = no;
    PHONET = no;
    PMBUS = no;
    PNP = no;
    PPP = no;
    PROVIDE_OHCI1394_DMA_INIT = no;
    PSTORE_LZ4_COMPRESS = no;
    PSTORE_LZO_COMPRESS = no;
    QCOM_EMAC = no;
    QCOM_QMI_HELPERS = no;
    QED = no;
    QED_FCOE = no;
    QED_LL2 = no;
    QED_OOO = no;
    QFMT_V1 = no;
    QLA3XXX = no;
    QLCNIC = no;
    QLCNIC_HWMON = no;
    QLCNIC_SRIOV = no;
    QNX4FS_FS = no;
    QNX6FS_FS = no;
    QRTR = no;
    QSEMI_PHY = no;
    R6040 = no;
    RAPIDIO = no;
    RAVE_SP_WATCHDOG = no;
    RCU_REF_SCALE_TEST = no;
    RCU_SCALE_TEST = no;
    RCU_TRACE = no;
    RC_CORE = no;
    RDS = no;
    REISERFS_FS = no;
    RENESAS_PHY = no;
    RETU_WATCHDOG = no;
    RFKILL_GPIO = no;
    RFKLL_GPIO = no;
    RMI4_2D_SENSOR = no;
    RMI4_CORE = no;
    RMI4_F03 = no;
    RMI4_F03_SERIO = no;
    RMI4_F11 = no;
    RMI4_F12 = no;
    RMI4_F30 = no;
    RMI4_I2C = no;
    RMI4_SMB = no;
    RMI4_SPI = no;
    RMNET = no;
    ROADRUNNER = no;
    ROCKCHIP_PHY = no;
    ROMFS_FS = no;
    RPMSG = no;
    RPMSG_CHAR = no;
    RPMSG_NS = no;
    RPMSG_QCOM_GLINK = no;
    RPMSG_QCOM_GLINK_RPM = no;
    RPMSG_VIRTIO = no;
    RTC_DRV_TEST = no;
    S2IO = no;
    SAMSUNG_LAPTOP = no;
    SAMSUNG_Q10 = no;
    SATA_ACARD_AHCI = no;
    SATA_INIC162X = no;
    SATA_NV = no;
    SATA_SIL24 = no;
    SBC_EPX_C3_WATCHDOG = no;
    SBC_FITPC2_WATCHDOG = no;
    SC1200_WDT = no;
    SC92031 = no;
    SCF_TORTURE_TEST = no;
    SCSI_3W_9XXX = no;
    SCSI_3W_SAS = no;
    SCSI_AACRAID = no;
    SCSI_ACARD = no;
    SCSI_ADVANSYS = no;
    SCSI_AHA152X = no;
    SCSI_AHA1542 = no;
    SCSI_AHA1740 = no;
    SCSI_AIC79XX = no;
    SCSI_AIC7XXX = no;
    SCSI_AIC94XX = no;
    SCSI_AM53C974 = no;
    SCSI_ARCMSR = no;
    SCSI_BFA_FC = no;
    SCSI_BNX2X_FCOE = no;
    SCSI_BNX2_ISCSI = no;
    SCSI_BUSLOGIC = no;
    SCSI_CHELSIO_FCOE = no;
    SCSI_CXGB3_ISCSI = no;
    SCSI_CXGB4_ISCSI = no;
    SCSI_DC395x = no;
    SCSI_DEBUG = no;
    SCSI_DMA = no;
    SCSI_DMX3191D = no;
    SCSI_DPT_I20 = no;
    SCSI_ENCLOSURE = no;
    SCSI_ESAS2R = no;
    SCSI_ESP_PIO = no;
    SCSI_FC_ATTRS = no;
    SCSI_FLASHPOINT = no;
    SCSI_GENERIC_NCR5380 = no;
    SCSI_GXGB3_ISCSI = no;
    SCSI_HPSA = no;
    SCSI_HPTIOP = no;
    SCSI_INIA100 = no;
    SCSI_INITIO = no;
    SCSI_IPR = no;
    SCSI_IPS = no;
    SCSI_ISCI = no;
    SCSI_ISCSI_ATTRS = no;
    SCSI_LPFC = no;
    SCSI_MPI3MR = no;
    SCSI_MPT2SAS = no;
    SCSI_MPT3SAS = no;
    SCSI_MVSAS = no;
    SCSI_MVUMI = no;
    SCSI_MYRB = no;
    SCSI_MYRS = no;
    SCSI_NETLINK = no;
    SCSI_PM8001 = no;
    SCSI_PMCRAID = no;
    SCSI_PROC_FS = no;
    SCSI_QLA_ISCSI = no;
    SCSI_QLOGIC_1280 = no;
    SCSI_SAS_ATTRS = no;
    SCSI_SAS_LIBSAS = no;
    SCSI_SMARTPQI = no;
    SCSI_SNIC = no;
    SCSI_SPI_ATTRS = no;
    SCSI_SRP_ATTRS = no;
    SCSI_STEX = no;
    SCSI_SYM53C8XX_2 = no;
    SCSI_UFSHCD = no;
    SENSORS_ABITUGURU = no;
    SENSORS_ABITUGURU3 = no;
    SENSORS_AD7314 = no;
    SENSORS_AD7414 = no;
    SENSORS_AD7418 = no;
    SENSORS_ADC128D818 = no;
    SENSORS_ADCXX = no;
    SENSORS_ADM1021 = no;
    SENSORS_ADM1025 = no;
    SENSORS_ADM1026 = no;
    SENSORS_ADM1029 = no;
    SENSORS_ADM1031 = no;
    SENSORS_ADM1177 = no;
    SENSORS_ADM1266 = no;
    SENSORS_ADM1275 = no;
    SENSORS_ADM9240 = no;
    SENSORS_ADS7828 = no;
    SENSORS_ADS7871 = no;
    SENSORS_ADT7310 = no;
    SENSORS_ADT7410 = no;
    SENSORS_ADT7411 = no;
    SENSORS_ADT7462 = no;
    SENSORS_ADT7470 = no;
    SENSORS_ADT7475 = no;
    SENSORS_ADT7X10 = no;
    SENSORS_AHT10 = no;
    SENSORS_AMC6821 = no;
    SENSORS_APPLESMC = no;
    SENSORS_AS370 = no;
    SENSORS_ASB100 = no;
    SENSORS_ASC7621 = no;
    SENSORS_ASPEED = no;
    SENSORS_ATXP1 = no;
    SENSORS_AXI_FAN_CONTROL = no;
    SENSORS_BEL_PFE = no;
    SENSORS_BH1770 = no;
    SENSORS_BPA_RS600 = no;
    SENSORS_CORSAIR_CPRO = no;
    SENSORS_DELL_SMM = no;
    SENSORS_DME1737 = no;
    SENSORS_DPS920AB = no;
    SENSORS_DRIVETEMP = no;
    SENSORS_DS1621 = no;
    SENSORS_DS620 = no;
    SENSORS_EMC1403 = no;
    SENSORS_EMC2103 = no;
    SENSORS_EMC6W201 = no;
    SENSORS_F71805F = no;
    SENSORS_F71882FG = no;
    SENSORS_F75375S = no;
    SENSORS_FAM15H_POWER = no;
    SENSORS_FSCHMD = no;
    SENSORS_FSP_3Y = no;
    SENSORS_FTSTEUTATES = no;
    SENSORS_G760A = no;
    SENSORS_G762 = no;
    SENSORS_GL518SM = no;
    SENSORS_GL520SM = no;
    SENSORS_HDAPS = no;
    SENSORS_HIH6130 = no;
    SENSORS_I5500 = no;
    SENSORS_I5K_AMB = no;
    SENSORS_IBMAEM = no;
    SENSORS_IBMPEX = no;
    SENSORS_IBM_CFFPS = no;
    SENSORS_INA209 = no;
    SENSORS_INA2XX = no;
    SENSORS_INA3221 = no;
    SENSORS_INSPUR_IPSPS = no;
    SENSORS_INTEL_M10_BMC_HWMON = no;
    SENSORS_IR35221 = no;
    SENSORS_IR36021 = no;
    SENSORS_IR38064 = no;
    SENSORS_IRPS5401 = no;
    SENSORS_ISL68137 = no;
    SENSORS_IT87 = no;
    SENSORS_JC42 = no;
    SENSORS_K8TEMP = no;
    SENSORS_LINEAGE = no;
    SENSORS_LIS3LV02D = no;
    SENSORS_LM25066 = no;
    SENSORS_LM63 = no;
    SENSORS_LM70 = no;
    SENSORS_LM73 = no;
    SENSORS_LM75 = no;
    SENSORS_LM77 = no;
    SENSORS_LM78 = no;
    SENSORS_LM80 = no;
    SENSORS_LM83 = no;
    SENSORS_LM85 = no;
    SENSORS_LM87 = no;
    SENSORS_LM90 = no;
    SENSORS_LM92 = no;
    SENSORS_LM93 = no;
    SENSORS_LM95234 = no;
    SENSORS_LM95241 = no;
    SENSORS_LM95245 = no;
    SENSORS_LTC2945 = no;
    SENSORS_LTC2947 = no;
    SENSORS_LTC2947_I2C = no;
    SENSORS_LTC2947_SPI = no;
    SENSORS_LTC2978 = no;
    SENSORS_LTC2990 = no;
    SENSORS_LTC2992 = no;
    SENSORS_LTC3815 = no;
    SENSORS_LTC4151 = no;
    SENSORS_LTC4215 = no;
    SENSORS_LTC4222 = no;
    SENSORS_LTC4245 = no;
    SENSORS_LTC4260 = no;
    SENSORS_LTC4261 = no;
    SENSORS_MAX1111 = no;
    SENSORS_MAX127 = no;
    SENSORS_MAX15301 = no;
    SENSORS_MAX16064 = no;
    SENSORS_MAX16065 = no;
    SENSORS_MAX1619 = no;
    SENSORS_MAX16601 = no;
    SENSORS_MAX1668 = no;
    SENSORS_MAX197 = no;
    SENSORS_MAX20730 = no;
    SENSORS_MAX20751 = no;
    SENSORS_MAX31722 = no;
    SENSORS_MAX31730 = no;
    SENSORS_MAX31785 = no;
    SENSORS_MAX31790 = no;
    SENSORS_MAX34440 = no;
    SENSORS_MAX6621 = no;
    SENSORS_MAX6639 = no;
    SENSORS_MAX6642 = no;
    SENSORS_MAX6650 = no;
    SENSORS_MAX6697 = no;
    SENSORS_MAX8688 = no;
    SENSORS_MC13783_ADC = no;
    SENSORS_MCP3021 = no;
    SENSORS_MENF21BMC_HWMON = no;
    SENSORS_MP2888 = no;
    SENSORS_MP2975 = no;
    SENSORS_MR75203 = no;
    SENSORS_NCT6683 = no;
    SENSORS_NCT6775 = no;
    SENSORS_NCT7802 = no;
    SENSORS_NCT7904 = no;
    SENSORS_NPCM7XX = no;
    SENSORS_NTC_THERMISTOR = no;
    SENSORS_NZXT_KRAKEN2 = no;
    SENSORS_PC87360 = no;
    SENSORS_PC87427 = no;
    SENSORS_PCF8591 = no;
    SENSORS_PIM4328 = no;
    SENSORS_PM6764TR = no;
    SENSORS_PMBUS = no;
    SENSORS_POWR1220 = no;
    SENSORS_PXE1610 = no;
    SENSORS_Q54SJ108A2 = no;
    SENSORS_SBTSI = no;
    SENSORS_SCH5627 = no;
    SENSORS_SCH5636 = no;
    SENSORS_SCH56XX_COMMON = no;
    SENSORS_SHT15 = no;
    SENSORS_SHT21 = no;
    SENSORS_SHT3x = no;
    SENSORS_SHT4x = no;
    SENSORS_SHTC1 = no;
    SENSORS_SIS5595 = no;
    SENSORS_SMM665 = no;
    SENSORS_SMSC47B397 = no;
    SENSORS_SMSC47M1 = no;
    SENSORS_SMSC47M192 = no;
    SENSORS_STPDDC60 = no;
    SENSORS_STTS751 = no;
    SENSORS_TC654 = no;
    SENSORS_TC74 = no;
    SENSORS_THMC50 = no;
    SENSORS_TMP102 = no;
    SENSORS_TMP103 = no;
    SENSORS_TMP108 = no;
    SENSORS_TMP401 = no;
    SENSORS_TMP421 = no;
    SENSORS_TMP513 = no;
    SENSORS_TPS23861 = no;
    SENSORS_TPS40422 = no;
    SENSORS_TPS53679 = no;
    SENSORS_TSL2550 = no;
    SENSORS_UCD9000 = no;
    SENSORS_UCD9200 = no;
    SENSORS_VIA686A = no;
    SENSORS_VIA_CPUTEMP = no;
    SENSORS_VT1211 = no;
    SENSORS_VT8231 = no;
    SENSORS_W83627EHF = no;
    SENSORS_W83627HF = no;
    SENSORS_W83773G = no;
    SENSORS_W83781D = no;
    SENSORS_W83791D = no;
    SENSORS_W83792D = no;
    SENSORS_W83793 = no;
    SENSORS_W83795 = no;
    SENSORS_W83L785TS = no;
    SENSORS_W83L786NG = no;
    SENSORS_XDPE122 = no;
    SENSORS_XGENE = no;
    SENSORS_ZL6100 = no;
    SERIO = no;
    SFC = no;
    SFC_FALCON = no;
    SFC_MCDI_LOGGING = no;
    SFC_MCDI_MON = no;
    SFC_SRIOV = no;
    SFP = no;
    SGIWD92_SCSI = no;
    SIOX = no;
    SIS190 = no;
    SIS900 = no;
    SKFP = no;
    SKGE = no;
    SKY2 = no;
    SLICOSS = no;
    SLIMBUS = no;
    SMSC37B787_WDT = no;
    SMSC911X = no;
    SMSC9420 = no;
    SMSC_PHY = no;
    SMSC_SCH311X_WDT = no;
    SND_BCD2000 = no;
    SND_SOC = no;
    SOFT_WATCHDOG = no;
    SONY_LAPTOP = no;
    SOUNDWIRE = no;
    SPI = lib.mkForce no;
    SPI_ALTERA = no;
    SPI_ALTERA_CORE = no;
    SPI_AMD = no;
    SPI_AXI_SPI_ENGINE = no;
    SPI_BITBANG = no;
    SPI_CADENCE = no;
    SPI_DESIGNWARE = no;
    SPI_DLN2 = no;
    SPI_DW_MMIO = no;
    SPI_DW_PCI = no;
    SPI_GPIO = no;
    SPI_LANTIQ_SSC = no;
    SPI_MUX = no;
    SPI_MXIC = no;
    SPI_NXP_FLEXSPI = no;
    SPI_OC_TINY = no;
    SPI_PXA2XX = no;
    SPI_PXA2XX_PCI = no;
    SPI_ROCKCHIP = no;
    SPI_SC18IS602 = no;
    SPI_SIFIVE = no;
    SPI_SPIDEV = no;
    SPI_XCOMM = no;
    SPI_XILINX = no;
    SPI_ZYNQMP_GQSPI = no;
    SPMI = no;
    SSB = no;
    STE10XP = no;
    STM = no;
    STMMAC_ETH = no;
    STMMAC_PCI = no;
    STMMAC_PLATFORM = no;
    SUNDANCE = no;
    SUNGEM = no;
    SURFACE_PLATFORMS = no;
    SXGBE_ETH = no;
    SYSTEM76_ACPI = no;
    SYSTEMPORT = no;
    SYSV_FS = no;
    TARGET_CORE = no;
    TCM_QLA2XXX = no;
    TCP_CONG_BIC = no;
    TCP_CONG_CDG = no;
    TCP_CONG_DCTCP = no;
    TCP_CONG_HSTCP = no;
    TCP_CONG_HTCP = no;
    TCP_CONG_HYBLA = no;
    TCP_CONG_ILLINOIS = no;
    TCP_CONG_NV = no;
    TCP_CONG_VEGAS = no;
    TCP_CONG_VENO = no;
    TCP_CONG_WESTWOOD = no;
    TCP_CONG_YEAH = no;
    TCP_MD5SIG = no;
    TEHUTI = no;
    TERANETICS_PHY = no;
    THINKPAD_LMI = no;
    THUNDERBOLT = no;
    THUNDER_NIC_BGX = no;
    THUNDER_NIC_PF = no;
    THUNDER_NIC_RGX = no;
    THUNDER_NIC_VF = no;
    TIFM_CORE = no;
    TIGON3 = no;
    TIGON3_HWMON = no;
    TINYDRM_HX8357D = no;
    TINYDRM_ILI9341 = no;
    TINYDRM_MI0283QT = no;
    TINYDRM_ST7735R = no;
    TIPC = no;
    TI_ST = no;
    TLAN = no;
    TOPSTAR_LAPTOP = no;
    TORTURE_TEST = no;
    TOSHIBA_BT_RFKILL = no;
    TOSHIBA_HAPS = no;
    TOSHIBA_WMI = no;
    TQMX86_WDT = no;
    TTPCI_EEPROM = no;
    TULIP = no;
    TYPHOON = no;
    UBIFS_FS = no;
    UDF_FS = lib.mkForce no;
    UFS_FS = no;
    ULI526X = no;
    UNISYS_VISORBUS = no;
    USBPCWATCHDOG = no;
    USB_ACM = no;
    USB_ADUTUX = no;
    USB_AMD5536UDC = no;
    USB_APPLEDISPLAY = no;
    USB_BDC_UDC = no;
    USB_C67X00_HCD = no;
    USB_CHAOSKEY = no;
    USB_CYPRESS_CY7C63 = no;
    USB_CYTHERM = no;
    USB_DUMMY_HCD = no;
    USB_EG20T = no;
    USB_EHSET_TEST_FIXTURE = no;
    USB_EMI26 = no;
    USB_EMI62 = no;
    USB_FOTG210_UDC = no;
    USB_FTDI_ELAN = no;
    USB_GOKU = no;
    USB_GR_UDC = no;
    USB_HSIC_USB3503 = no;
    USB_HSIC_USB4604 = no;
    USB_HUB_USB251XB = no;
    USB_IDMOUSE = no;
    USB_IOWARRIOR = no;
    USB_ISIGHTFW = no;
    USB_LCD = no;
    USB_LD = no;
    USB_LEGOTOWER = no;
    USB_LINK_LAYER_TEST = no;
    USB_M66592 = no;
    USB_MV_U3D = no;
    USB_MV_UDC = no;
    USB_NET2272 = no;
    USB_NET2280 = no;
    USB_NET_AX8817X = no;
    USB_NET_DRIVERS = no;
    USB_NET_RNDIS_WLAN = no;
    USB_NET_SMSC95XX = no;
    USB_PXA27X = no;
    USB_R8A66597 = no;
    USB_SEVSEG = no;
    USB_SISUSBVGA = no;
    USB_SNP_CORE = no;
    USB_TEST = no;
    USB_TMC = no;
    USB_TRANCEVIBRATOR = no;
    USB_USBNET = no;
    USB_VL600 = no;
    USB_WDM = no;
    USB_YUREX = no;
    USB_ZERO = no;
    VFIO = no;
    VIA_RHINE = no;
    VIA_VELOCITY = no;
    VIA_WDT = no;
    VIDEO_CX2341X = no;
    VIDEO_TVEEPROM = no;
    VIDEO_VIVID = no;
    VIRT_WIFI = no;
    VITESSE_PHY = no;
    VMD = no;
    VME_BUS = no;
    VMWARE_PVSCSI = no;
    VMXNET3 = no;
    VORTEX = no;
    VSOCKETS = no;
    VXFS_FS = no;
    VXGE = no;
    VXLAN = no;
    W1 = no;
    W83627HF_WDT = no;
    W83877F_WDT = no;
    W83977F_WDT = no;
    WAFER_WDT = no;
    WAN = lib.mkForce no;
    WD719X = no;
    WDAT_WDT = no;
    WDTPCI = no;
    WIMAX = no;
    WINBOND_840 = no;
    WIRELESS_HOTKEY = no;
    WIZNET_BUS_ANY = no;
    WIZNET_W5100 = no;
    WIZNET_W5100_SPI = no;
    WIZNET_W5300 = no;
    WLAN_VENDOR_ADMTEK = no;
    WLAN_VENDOR_ATH = no;
    WLAN_VENDOR_ATMEL = no;
    WLAN_VENDOR_BROADCOM = no;
    WLAN_VENDOR_CISCO = no;
    WLAN_VENDOR_INTERSIL = no;
    WLAN_VENDOR_MARVELL = no;
    WLAN_VENDOR_MEDIATEK = no;
    WLAN_VENDOR_MICROCHIP = no;
    WLAN_VENDOR_QUANTENNA = no;
    WLAN_VENDOR_RALINK = no;
    WLAN_VENDOR_REALTEK = no;
    WLAN_VENDOR_RSI = no;
    WLAN_VENDOR_ST = no;
    WWAN = no;
    X86_PLATFORM_DRIVERS_DELL = lib.mkForce no;
    X86_PLATFORM_DRIVERS_INTEL = no;
    X86_PMEM_LEGACY = no;
    XEN = lib.mkForce no;
    XIAOMI_WMI = no;
    XILINX_AXI_EMAC = no;
    XILINX_EMACLITE = no;
    XILINX_GMII2RGMII = no;
    XILINX_LL_TEMAC = no;
    XILINX_WATCHDOG = no;
    XILLYBUS = no;
    XILLYUSB = no;
    YELLOWFIN = no;
    ZIIRAVE_WATCHDOG = no;
    MADERA_IRQ = no;
    BOARD_TPCI200 = no;
    SERIAL_IPOCTAL = no;
    RESET_CONTROLLER = no;

    # NOTE: generate our own key for r13y
    #MODULE_SIG = no;
    #MODULE_SIG_FORCE = no;
    #MODULE_SIG_ALL = yes;
    #MODULE_SIG_SHA512 = yes;
    #MODULE_SIG_KEY = freeform "certs/signing_key.pem";
  };

  ignoreConfigErrors = true;

  #argsOverride = {
  #  prePatch = ''
  #    ${pkgs.coreutils}/bin/ls
  #    ${pkgs.findutils}/bin/find . \
  #      -type f                    \
  #      -name "*.S"                \
  #      -name "*.c"                \
  #      -exec                      \
  #        ${pkgs.gnused}/bin/sed -i s/EXPORT_SYMBOL_GPL/EXPORT_SYMBOL {} +
  #    poo
  #  '';
  #};
})
