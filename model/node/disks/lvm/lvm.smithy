$version: "2.0"

namespace awlsring.proxmox

resource LVM {
    identifiers: {
        node: NodeName
    },
    operations: [ CreateLVM, ListLVMs, DeleteLVM ]
}

structure LVMSummary {
    @required
    children: LVMSummaries

    @required
    @documentation("Is leaf. This is a boolean intergar, 1 is true, 0 is false")
    leaf: Integer

    name: DevicePath

    @documentation("The free space on lvm in bytes")
    free: Long

    @documentation("The total size of lvm in bytes")
    size: Long

    @jsonName("lvcount")
    @documentation("The number of logical volumes")
    lvCount: Integer
}

list LVMSummaries {
    member: LVMSummary
}