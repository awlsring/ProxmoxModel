$version: "2.0"

namespace awlsring.proxmox

resource Disks {
    identifiers: {
        node: NodeIdentifier
    },
    resources: [ Directory, LVM, LVMThin, ZFS ],
    operations: [ ListDisks, GetSmartHealth, WipeDisk, InitializeGPT ]
}

@pattern("^\/dev\/[a-zA-Z0-9\/]+$")
string DevicePath

structure DiskSummary {
    @required
    @jsonName("devpath")
    disk: DevicePath

    @required
    gpt: Integer

    @required
    @jsonName("osdid")
    osdID: Integer

    @documentation("The size of the disk in bytes")
    @required
    size: Long

    @jsonName("by_id_link")
    idLink: String

    model: String

    parent: String

    health: String

    serial: String

    rpm: Integer

    @jsonName("wwn")
    worldWideNumber: String

    vendor: String

    wearout: Integer

    type: DiskType

    mounted: Integer
}

list DiskSummaries {
    member: DiskSummary
}

enum DiskType {
    NVME = "nvme"
    SSD = "ssd"
    HDD = "hdd"
    PARTITION = "partition"
}