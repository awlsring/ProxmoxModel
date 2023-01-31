$version: "2.0"

namespace awlsring.proxmox

@documentation("Removes an LVM thinpool.")
@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/disks/lvmthin/{name}", code: 200)
operation DeleteLVMThin {
    input: DeleteLVMThinInput,
    output: DeleteLVMThinOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteLVMThinInput {
    @required
    @httpLabel
    node: NodeIdentifier

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
structure DeleteLVMThinOutput {
    @required
    @jsonName("data")
    output: String
}