$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/storage", code: 200)
operation ListStorage {
    input: ListStorageInput,
    output: ListStorageOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListStorageInput {
    @jsonName("type")
    @httpQuery("type")
    storageType: StorageType
}

@output
structure ListStorageOutput {
    @required
    @jsonName("data")
    summaries: StorageSummaries
}