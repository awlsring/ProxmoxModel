$version: "2.0"

namespace awlsring.proxmox

@idempotent
@documentation("Renew existing certificate from CA.")
@http(method: "PUT", uri: "/nodes/{node}/certificates/acme/certificate", code: 200)
operation RenewNodeCertificate {
    input: RenewNodeCertificateInput
    output: RenewNodeCertificateOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure RenewNodeCertificateInput {
    @required
    @httpLabel
    node: NodeIdentifier,

    @documentation("Force renewal even if expirary is more than 30 days away.")
    force: BooleanInteger
}

@output
structure RenewNodeCertificateOutput {
    @required
    @jsonName("data")
    result: String
}