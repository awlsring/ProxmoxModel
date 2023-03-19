$version: "2.0"

namespace awlsring.proxmox

resource CephManager {
    identifiers: {
        node: NodeIdentifier,
        manager: CephManagerIdentifier
    },
    delete: DeleteCephManager,
    list: ListCephManagers
    operations: [CreateCephManager]
}

string CephManagerIdentifier