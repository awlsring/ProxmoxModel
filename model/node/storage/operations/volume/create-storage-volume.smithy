$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/storage/{storage}/content", code: 200)
operation CreateStorageVolume {
    input: CreateStorageVolumeInput
    output: CreateStorageVolumeOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateStorageVolumeInput {
    @required
    @httpLabel
    @jsonName("node")
    node: NodeIdentifier,

    @required
    @httpLabel
    @jsonName("storage")
    storage: StorageIdentifier,

    @required
    @documentation("The filename of the new file")
    filename: String,

    @required
    @documentation("The new size in byte string")
    size: Long,

    @required
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier,

    @jsonName("format")
    format: StorageVolumeType,
}

@output
structure CreateStorageVolumeOutput {
    @required
    @jsonName("data")
    result: String
}