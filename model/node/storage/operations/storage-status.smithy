$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/storage/{storage}/status", code: 200)
operation GetStorageStatus {
    input: GetStorageStatusInput
    output: GetStorageStatusOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetStorageStatusInput {
    @required
    @httpLabel
    @jsonName("node")
    node: NodeIdentifier,

    @required
    @httpLabel
    @jsonName("storage")
    storage: StorageIdentifier,
}

@output
structure GetStorageStatusOutput {
    @required
    @jsonName("data")
    status: StorageStatusSummary,
}

structure StorageStatusSummary {
    content: String,
    
    type: StorageType,

    @jsonName("shared")
    isShared: BooleanInteger,

    @jsonName("active")
    isActive: BooleanInteger,

    @jsonName("enabled")
    isEnabled: BooleanInteger,

    @jsonName("total")
    totalSpace: Long,

    @jsonName("used")
    usedSpace: Long,

    @jsonName("avail")
    availableSpace: Long,
}