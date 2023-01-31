$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/storage/{storage}", code: 200)
operation GetStorage {
    input: GetStorageInput,
    output: GetStorageOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetStorageInput {
    @required
    @httpLabel
    storage: StorageIdentifier
}

@output
structure GetStorageOutput {
    @required
    @jsonName("data")
    summaries: StorageSummary
}