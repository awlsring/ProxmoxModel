$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/storage", code: 200)
operation ListNodeStorage {
    input: ListNodeStorageInput
    output: ListNodeStorageOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListNodeStorageInput {
    @required
    @httpLabel
    @jsonName("node")
    node: NodeIdentifier,

    @httpQuery("content")
    content: String,

    @httpQuery("enabled")
    @jsonName("enabled")
    isEnabled: BooleanInteger,

    @httpQuery("storage")
    storage: StorageIdentifier,

    @httpQuery("target")
    @documentation("If target and node differ, only return storage that is available on both nodes.")
    target: String,
}

@output
structure ListNodeStorageOutput {
    @required
    @jsonName("data")
    summaries: NodeStorageSummaries
}

structure NodeStorageSummary {
    @required
    storage: StorageIdentifier,

    @required
    type: StorageType,

    @required
    @documentation("The allowed storage content types.")
    content: String,

    @jsonName("active")
    isActive: BooleanInteger,

    @jsonName("enabled")
    isEnabled: BooleanInteger,

    @jsonName("shared")
    @documentation("Whether the storage is shared across all nodes.")
    isShared: BooleanInteger,

    @jsonName("total")
    totalSpace: Long,

    @jsonName("used")
    usedSpace: Long,

    @jsonName("used_fraction")
    usedPercentage: Float,

    @jsonName("avail")
    freeSpace: Long,
}

list NodeStorageSummaries {
    member: NodeStorageSummary,
}