$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/nodes/{node}/apt/repositories", code: 200)
operation AddRepository {
    input: AddRepositoryInput
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure AddRepositoryInput {
    @required
    @httpLabel
    node: NodeIdentifier,

    @required
    @httpQuery("handle")
    @documentation("Handle that identifies the repository")
    handle: String

    @httpQuery("digest")
    @documentation("Digest to detect modifications")
    digest: String
}