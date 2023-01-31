$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/cluster/config/nodes/{node}", code: 200)
operation RemoveCorosyncNode {
    input: RemoveCorosyncNodeInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure RemoveCorosyncNodeInput {
    @required
    @httpLabel
    node: NodeIdentifier
}