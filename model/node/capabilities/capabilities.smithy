$version: "2.0"

namespace awlsring.proxmox

resource Capabilities {
    identifiers: {
        node: NodeName
    }
    resources: [ QemuCapability ]
}