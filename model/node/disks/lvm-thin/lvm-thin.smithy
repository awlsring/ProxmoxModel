$version: "2.0"

namespace awlsring.proxmox

resource LVMThin {
    identifiers: {
        node: NodeName
    },
    operations: [ CreateLVMThin, ListLVMThins, DeleteLVMThin ]
}

structure LVMThinSummary {
    @required
    @jsonName("lv")
    name: LVMThinSummaries

    @required
    @documentation("The size of the lvm thin pool in bytes")
    @jsonName("lv_size")
    size: Long

    @required
    @documentation("The used size of the lvm thin pool in bytes")
    @jsonName("used")
    used: Long

    @required
    @documentation("The size of the metadata lv in bytes")
    @jsonName("metadata_size")
    metadataSize: Long

    @required
    @documentation("The used size of the metadata lv in bytes")
    @jsonName("metadata_used")
    metadataUsed: Long

    @required
    @jsonName("vg")
    @documentation("The associated volume group.")
    volumeGroup: String
}

list LVMThinSummaries {
    member: LVMThinSummary
}