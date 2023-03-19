$version: "2.0"

namespace awlsring.proxmox

resource CephMonitor {
    identifiers: {
        node: NodeIdentifier,
        monitor: CephMonitorIdentifier
    },
    delete: DeleteCephMonitor,
    list: ListCephMonitors
    operations: [CreateCephMonitor]
}

string CephMonitorIdentifier