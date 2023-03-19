$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/ceph/mgr", code: 200)
operation ListCephManagers {
    input: ListCephManagersInput,
    output: ListCephManagersOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListCephManagersInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure ListCephManagersOutput {
    @required
    @jsonName("data")
    summaries: CephMonitorSummaries
}

structure CephManagerSummary {
    @required
    @jsonName("name")
    name: String

    @required
    state: String

    @jsonName("addr")
    address: Integer

    @jsonName("host")
    host: String
}

list CephManagerSummaries {
    member: CephManagerSummary
}