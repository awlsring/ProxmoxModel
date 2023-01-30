$version: "2.0"

namespace awlsring.proxmox

@documentation("Order a new certificate from ACME-compatible CA.")
@http(method: "POST", uri: "/nodes/{node}/certificates/acme/certificate", code: 200)
operation OrderNodeCertificate {
    input: OrderNodeCertificateInput
    output: OrderNodeCertificateOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure OrderNodeCertificateInput {
    @required
    @httpLabel
    node: NodeName,

    @documentation("Overwrite existing custom certificate.")
    force: BooleanInteger
}

@output
structure OrderNodeCertificateOutput {
    @required
    @jsonName("data")
    result: String
}