$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/ceph/mon/{monitor}", code: 200)
operation CreateCephMonitor {
    input: CreateCephMonitorInput,
    output: CreateCephMonitorOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateCephMonitorInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("monid")
    monitor: CephMonitorIdentifier

    @jsonName("mon-address")
    address: String
}

@output
structure CreateCephMonitorOutput {
    @required
    @jsonName("data")
    result: String
}