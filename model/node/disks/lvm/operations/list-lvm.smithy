$version: "2.0"

namespace awlsring.proxmox

@documentation("List LVM volume groups on node.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/disks/lvm", code: 200)
operation ListLVMs {
    input: ListLVMsInput,
    output: ListLVMsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListLVMsInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure ListLVMsOutput {
    @required
    @jsonName("data")
    lvm: ListLVMsData
}

structure ListLVMsData {
    @required
    @jsonName("leaf")
    leaf: BooleanInteger

    @required
    @jsonName("children")
    children: LVMChildren
}

structure LVMChild {
    children: LVMChildren

    @required
    @documentation("Is leaf. This is a boolean intergar, 1 is true, 0 is false")
    leaf: BooleanInteger

    name: String

    @documentation("The free space on lvm in bytes")
    free: Long

    @documentation("The total size of lvm in bytes")
    size: Long

    @jsonName("lvcount")
    @documentation("The number of logical volumes")
    lvCount: Integer
}

list LVMChildren {
    member: LVMChild
}