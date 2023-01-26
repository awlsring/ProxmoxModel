$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/storage", code: 200)
operation ListStorage {
    output: ListStorageOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure ListStorageOutput {
    @required
    @jsonName("data")
    summaries: StorageSummaries
}