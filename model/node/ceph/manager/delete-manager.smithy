$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/ceph/mgr/{manager}", code: 200)
operation DeleteCephManager {
    input: DeleteCephManagerInput,
    output: DeleteCephManagerOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteCephManagerInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("id")
    manager: CephManagerIdentifier
}

@output
structure DeleteCephManagerOutput {
    @required
    @jsonName("data")
    result: String
}