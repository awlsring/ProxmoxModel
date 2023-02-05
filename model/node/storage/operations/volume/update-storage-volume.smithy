$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/nodes/{node}/storage/{storage}/content/{volume}", code: 200)
operation UpdateStorageVolume {
    input: UpdateStorageVolumeInput
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure UpdateStorageVolumeInput {
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

    @documentation("New notes for the volume")
    notes: String,

    @required
    @jsonName("protected")
    isProtected: BooleanInteger,
}