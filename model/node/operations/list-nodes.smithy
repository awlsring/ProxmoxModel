$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes", code: 200)
operation ListNodes {
    output: ListNodesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure ListNodesOutput {
    @required
    data: NodeSummaries
}