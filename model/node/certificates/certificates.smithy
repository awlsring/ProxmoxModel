$version: "2.0"

namespace awlsring.proxmox

resource Certificate {
    identifiers: {
        node: NodeIdentifier
    }
    operations: [
        ListNodeCertificates,
        AddCustomNodeCertificate,
        DeleteNodeCertificate,
        RenewNodeCertificate,
        OrderNodeCertificate
    ]
}

structure NodeCertificate {
    @documentation("The certificate's filename.")
    filename: String,

    @documentation("The certificate's fingerprint.")
    fingerprint: String,

    @documentation("The certificate's issuer.")
    issuer: String,

    @jsonName("notAfter")
    @documentation("The certificate's notAfter timestamp.")
    notAfter: Integer,

    @jsonName("notBefore")
    @documentation("The certificate's notAfter timestamp.")
    notBefore: Integer,

    pem: String,

    @jsonName("public-key-bits")
    @documentation("The certificate's key size.")
    publicKeyBits: String,

    @jsonName("public-key-type")
    @documentation("The certificate's key algorithm.")
    publicKeyType: String,

    @documentation("The certificate's sans")
    sans: StringList,

    @documentation("The certificate's subject.")
    subject: String,
}

list NodeCertificates {
    member: NodeCertificate
}