$version: "2.0"

namespace awlsring.proxmox

@idempotent
@documentation("Renew existing certificate from CA.")
@http(method: "DELETE", uri: "/nodes/{node}/certificates/acme/certificate", code: 200)
operation DeleteNodeCertificate {
    input: DeleteNodeCertificateInput
    output: DeleteNodeCertificateOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteNodeCertificateInput {
    @required
    @httpLabel
    node: NodeName,
}

@output
structure DeleteNodeCertificateOutput {
    @required
    @jsonName("data")
    result: String
}