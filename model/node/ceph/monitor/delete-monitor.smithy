$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/ceph/mon/{monitor}", code: 200)
operation DeleteCephMonitor {
    input: DeleteCephMonitorInput,
    output: DeleteCephMonitorOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteCephMonitorInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("monid")
    monitor: CephMonitorIdentifier
}

@output
structure DeleteCephMonitorOutput {
    @required
    @jsonName("data")
    result: String
}