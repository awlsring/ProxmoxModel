$version: "2.0"

namespace awlsring.proxmox

@documentation("Create a LVM volume group.")
@http(method: "POST", uri: "/nodes/{node}/disks/lvm", code: 200)
operation CreateLVM {
    input: CreateLVMInput,
    output: CreateLVMOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateLVMInput {
    @required
    @httpLabel
    node: NodeName

    @required
    @documentation("The device to create the lvm on.")
    device: DevicePath

    @required
    @documentation("The storage identifier.")
    name: String

    @jsonName("add_storage")
    @documentation("Configure storage using the lvm. Takes a boolean integer value (0 false, 1 true).")
    addStorage: Integer
}

@output
structure CreateLVMOutput {
    @required
    @jsonName("data")
    output: String
}

