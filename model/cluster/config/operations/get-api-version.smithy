$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/cluster/config/apiversion", code: 200)
operation GetClusterApiVersion {
    output: GetClusterApiVersionOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure GetClusterApiVersionOutput {
    @documentation("API version")
    @jsonName("data")
    apiVersion: String
}