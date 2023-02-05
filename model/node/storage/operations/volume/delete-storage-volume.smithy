$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/storage/{storage}/content/{volume}", code: 200)
operation DeleteStorageVolume {
    input: DeleteStorageVolumeInput
    output: DeleteStorageVolumeOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteStorageVolumeInput {
    @required
    @httpLabel
    @jsonName("node")
    node: NodeIdentifier,

    @required
    @httpLabel
    @jsonName("storage")
    storage: StorageIdentifier,

    @required
    @httpLabel
    volume: VolumeIdentifier,

    @jsonName("delay")
    @httpQuery("delay")
    @documentation("Delay in seconds to wait for task to finish.")
    delay: Integer,
}

@output
structure DeleteStorageVolumeOutput {
    @required
    @jsonName("data")
    result: String
}