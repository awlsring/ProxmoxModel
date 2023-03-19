$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/ceph/mgr/{manager}", code: 200)
operation CreateCephManager {
    input: CreateCephManagerInput,
    output: CreateCephManagerOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateCephManagerInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("id")
    manager: CephManagerIdentifier
}

@output
structure CreateCephManagerOutput {
    @required
    @jsonName("data")
    result: String
}