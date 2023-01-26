$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/version", code: 200)
operation GetVersion {
    output: GetVersionOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure GetVersionOutput {
    @required
    @jsonName("data")
    summary: VersionSummary
}

structure VersionSummary {
    @required
    version: String,

    @required
    release: String,

    @required
    @jsonName("repoid")
    repoId: String
}