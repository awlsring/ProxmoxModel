$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/apt/repositories", code: 200)
operation ChangeRepositoryProperties {
    input: ChangeRepositoryPropertiesInput
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ChangeRepositoryPropertiesInput {
    @required
    @httpLabel
    node: NodeName,

    @required
    @httpQuery("path")
    @documentation("Path to the containing file")
    path: String

    @required
    @httpQuery("index")
    @documentation("Index within the file")
    index: Integer

    @httpQuery("digest")
    @documentation("Digest to detect modifications")
    digest: String

    @httpQuery("enabled")
    @documentation("Wether the repository is enabled")
    enabled: Boolean
}