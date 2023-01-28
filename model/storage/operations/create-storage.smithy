$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/storage", code: 200)
operation CreateStorage {
    input: CreateStorageInput,
    output: CreateStorageOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateStorageInput {
    @required
    storage: StorageName

    @required
    type: StorageType

    @jsonName("authsupported")
    authSupported: String

    @documentation("The base volume to use. ")
    base: String

    @jsonName("blocksize")
    blockSize: String

    @jsonName("bwlimit")
    bandwidthLimit: String

    @jsonName("comstar_hg")
    comstarHostGroup: String

    @jsonName("comstar_tg")
    comstarTargetGroup: String
}

@output
structure CreateStorageOutput {
    @required
    @jsonName("data")
    summaries: StorageSummary
}