$version: "2.0"

namespace awlsring.proxmox

resource VirtualMachine {
    identifiers: {
        node: NodeName,
        vmId: VmId
    },
    list: ListVirtualMachines,
}

string VmId

structure VirtualMachineSummary {
    @required
    vmid: Integer,
    mem: Long,
    maxmem: Long,
    disk: Long,
    maxdisk: Long,
    name: String,
    status: String,
    uptime: Long,
    netin: Long,
    netout: Long,
    diskread: Long,
    diskwrite: Long,
    cpus: Integer,
    pid: Integer,
    tags: String,
    lock: String,
    qmpstatus: String
}

list VirtualMachineSummaries {
    member: VirtualMachineSummary
}