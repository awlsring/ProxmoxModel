$version: "2.0"

namespace awlsring.proxmox

enum VirtualMachineArchitecture {
    @documentation("x86_64")
    X86_64,

    @documentation("aarch64")
    AARCH64,
}

enum VirtualMachineCloudInitType {
    CONFIG_DRIVE_2 = "configdrive2",
    NOCLOUD = "nocloud",
    OPEN_NEBULA = "opennebula",
}

enum VirtualMachineHugePages {
    ANY = "any"
    IS_2 = "2"
    IS_1024 = "1024"
}

enum VirtualMachineKeyboard {
    DE = "de"
    DE_CH = "de-ch"
    DA = "da"
    EN_GB = "en-gb"
    EN_US = "en-us"
    ES = "es"
    FI = "fi"
    FR = "fr"
    FR_BE = "fr-be"
    FR_CH = "fr-ch"
    FR_CA = "fr-ca"
    HU = "hu"
    IS = "is"
    IT = "it"
    JA = "ja"
    LT = "lt"
    MK = "mk"
    NL = "nl"
    NO = "no"
    PL = "pl"
    PT = "pt"
    PT_BR = "pt-br"
    SV = "sv"
    SL = "sl"
    TR = "tr"
}

enum VirtualMachineConfigLock {
    BACKUP = "backup"
    CLONE = "clone"
    CREATE = "create"
    MIGRATE = "migrate"
    ROLLBACK = "rollback"
    SNAPSHOT = "snapshot"
    SNAPSHOT_DELETE = "snapshot-delete"
    SUSPENDING = "suspending"
    SUSPENDED = "suspended"
}

enum VirtualMachineOperatingSystem {
    OTHER = "other"
    WINDOWS_XP = "wxp"
    WINDOWS_2003 = "w2k3"
    WINDOWS_2000 = "w2k"
    WINDOWS_2008 = "w2k8"
    WINDOWS_VISTA = "wvista"
    WINDOWS_7 = "w7"
    WINDOWS_8 = "w8"
    WINDOWS_10 = "w10"
    WINDOWS_11 = "w11"
    LINUX_2_4 = "l24"
    LINUX_2_6 = "l26"
    SOLARIS = "solaris"
}

enum VirtualMachineScsiControllerType {
    LSI = "lsi"
    LSI53C810 = "lsi53c810"
    VIRTIO_SCSI_PCI = "virtio-scsi-pci"
    MEGASAS = "megasas"
    PVSCSI = "pvscsi"
}