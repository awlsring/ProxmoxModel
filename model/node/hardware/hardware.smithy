$version: "2.0"

namespace awlsring.proxmox

resource Hardware {
    identifiers: {
        node: NodeName
    },
    operations: [
        ListUsbDevices,
        ListPciDevices,
        ListPciDeviceMediatedDevices,
    ]
}