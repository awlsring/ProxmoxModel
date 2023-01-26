$version: "2.0"

namespace awlsring.proxmox

resource Node {
    identifiers: { node: NodeName },
    list: ListNodes,
    resources: [ VirtualMachine ]
}

@pattern("^[A-Za-z0-9 ]+$")
string NodeName

structure NodeSummary {
    @required
    node: NodeName,
    maxmem: Long,
    mem: Long,
    disk: Long,
    maxcpu: Integer,
    id: String,
    level: String,
    ssl_fingerprint: String,
    type: String,
    cpu: Float,
    uptime: Long,
    status: String,
    maxdisk: Long,
}

list NodeSummaries {
    member: NodeSummary
}