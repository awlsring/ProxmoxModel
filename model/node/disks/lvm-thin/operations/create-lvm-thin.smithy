$version: "2.0"

namespace awlsring.proxmox

@documentation("Create a LVM thinpool.")
@http(method: "POST", uri: "/nodes/{node}/disks/lvmthin", code: 200)
operation CreateLVMThin {
    input: CreateLVMThinInput,
    output: CreateLVMThinOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateLVMThinInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @documentation("The device to create the lvm thinpool on.")
    device: DevicePath

    @required
    @documentation("The storage identifier.")
    name: String

    @jsonName("add_storage")
    @documentation("Configure storage using the lvm thinpool. Takes a boolean integer value (0 false, 1 true).")
    addStorage: Integer
}

@output
structure CreateLVMThinOutput {
    @required
    @jsonName("data")
    output: String
}

