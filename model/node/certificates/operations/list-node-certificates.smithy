$version: "2.0"

namespace awlsring.proxmox

@readonly
@documentation("Get information about the node's certificates.")
@http(method: "GET", uri: "/nodes/{node}/certificates/info", code: 200)
operation ListNodeCertificates {
    input: ListNodeCertificatesInput
    output: ListNodeCertificatesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListNodeCertificatesInput {
    @required
    @httpLabel
    node: NodeName,
}

@output
structure ListNodeCertificatesOutput {
    @required
    @jsonName("data")
    certificates: NodeCertificates
}