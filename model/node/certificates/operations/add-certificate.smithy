$version: "2.0"

namespace awlsring.proxmox

@idempotent
@documentation("Add or update a custom certificate.")
@http(method: "POST", uri: "/nodes/{node}/certificates/custom", code: 200)
operation AddCustomNodeCertificate {
    input: AddCustomNodeCertificateInput
    output: AddCustomNodeCertificateOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure AddCustomNodeCertificateInput {
    @required
    @httpLabel
    node: NodeIdentifier,

    @required
    @jsonName("certificates")
    @documentation("PEM encoded certificate.")
    certificate: String

    @documentation("Overwrite existing custom or ACME certificate.")
    force: BooleanInteger
    
    @documentation("PEM encoded private key.")
    key: String

    @documentation("Restart the PVE proxy.")
    restart: BooleanInteger
}

@output
structure AddCustomNodeCertificateOutput {
    @required
    @jsonName("data")
    certificate: NodeCertificate
}