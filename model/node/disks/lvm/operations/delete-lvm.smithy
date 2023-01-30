$version: "2.0"

namespace awlsring.proxmox

@documentation("Removes an LVM volume group.")
@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/disks/lvm/{name}", code: 200)
operation DeleteLVM {
    input: DeleteLVMInput,
    output: DeleteLVMOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteLVMInput {
    @required
    @httpLabel
    node: NodeName

    @required
    @httpLabel
    @documentation("The storage identifier.")
    name: String

    @httpQuery("cleanup-config")
    @documentation("Marks the associated storage as not available on this node anr removes them from the config. Takes a boolean integer value (0 false, 1 true).")
    cleanupConfig: Integer

    @httpQuery("cleanup-disks")
    @documentation("Wipes the disk. Takes a boolean integer value (0 false, 1 true).")
    cleanupDisks: Integer
}

@output
structure DeleteLVMOutput {
    @required
    @jsonName("data")
    output: String
}