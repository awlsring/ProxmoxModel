$version: "2.0"

namespace awlsring.proxmox

resource QemuCapability {
    identifiers: {
        node: NodeName
    }
    operations: [ ListCpuCapabilities, ListMachineCapabilities ]
}