$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/cluster/config/nodes", code: 200)
operation ListCorosyncNodes {
    output: ListCorosyncNodesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure ListCorosyncNodesOutput {
    @required
    @jsonName("data")
    summaries: CorosyncNodeSummaries
}