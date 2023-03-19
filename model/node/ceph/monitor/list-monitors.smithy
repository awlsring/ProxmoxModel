$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/ceph/mon", code: 200)
operation ListCephMonitors {
    input: ListCephMonitorsInput,
    output: ListCephMonitorsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListCephMonitorsInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure ListCephMonitorsOutput {
    @required
    @jsonName("data")
    summaries: CephMonitorSummaries
}

structure CephMonitorSummary {
    @required
    @jsonName("name")
    name: String

    @jsonName("addr")
    address: Integer

    @jsonName("host")
    host: String
}

list CephMonitorSummaries {
    member: CephMonitorSummary
}