$version: "2.0"

namespace awlsring.proxmox

resource Capabilities {
    identifiers: {
        node: NodeIdentifier
    }
    resources: [ QemuCapability ]
}