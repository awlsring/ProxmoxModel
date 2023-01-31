$version: "2.0"

namespace awlsring.proxmox

@documentation("Unmounts the storage and removes the mount unit.")
@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/disks/directory/{name}", code: 200)
operation DeleteDirectory {
    input: DeleteDirectoryInput,
    output: DeleteDirectoryOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteDirectoryInput {
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
structure DeleteDirectoryOutput {
    @required
    @jsonName("data")
    output: String
}