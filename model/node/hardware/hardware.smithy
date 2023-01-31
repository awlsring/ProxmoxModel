$version: "2.0"

namespace awlsring.proxmox

resource Hardware {
    identifiers: {
        node: NodeIdentifier
    },
    operations: [
        ListUsbDevices,
        ListPciDevices,
        ListPciDeviceMediatedDevices,
    ]
}