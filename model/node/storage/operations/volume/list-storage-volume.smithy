$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/storage/{storage}/content", code: 200)
operation ListStorageVolumes {
    input: ListStorageVolumesInput
    output: ListStorageVolumesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListStorageVolumesInput {
    @required
    @httpLabel
    @jsonName("node")
    node: NodeIdentifier,

    @required
    @httpLabel
    @jsonName("storage")
    storage: StorageIdentifier,

    @httpQuery("content")
    content: String,

    @httpQuery("vmid")
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier,
}

@output
structure ListStorageVolumesOutput {
    @required
    @jsonName("data")
    summaries: StorageVolumeSummaries
}

structure StorageVolumeSummary {
    @required
    format: String,

    @required
    @documentation("The size of the storage content in bytes.")
    size: Long,

    @required
    @jsonName("volid")
    volumeId: VolumeIdentifier,

    @jsonName("ctime")
    @documentation("The creation time of the storage content in seconds since the epoch.")
    creationTime: Long,

    encrypted: String,

    @jsonName("notes")
    storage: String,

    @jsonName("parent")
    parentVolume: VolumeIdentifier,

    @jsonName("protected")
    isProtected: BooleanInteger,

    @jsonName("used")
    @documentation("The amount of storage content used in bytes.")
    usedSpace: Long,

    @jsonName("vmid")
    vmId: VirtualMachineIdentifier,
}

list StorageVolumeSummaries {
    member: StorageVolumeSummary
}