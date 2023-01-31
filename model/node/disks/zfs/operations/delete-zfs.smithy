$version: "2.0"

namespace awlsring.proxmox

@documentation("Destroys a ZFS pool.")
@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/disks/zfs/{name}", code: 200)
operation DeleteZFSPool {
    input: DeleteZFSPoolInput,
    output: DeleteZFSPoolOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteZFSPoolInput {
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
structure DeleteZFSPoolOutput {
    @required
    @jsonName("data")
    output: String
}