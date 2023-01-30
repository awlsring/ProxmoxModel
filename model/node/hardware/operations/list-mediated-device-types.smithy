$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/hardware/pci/{deviceId}", code: 200)
operation ListPciDeviceMediatedDevices {
    input: ListPciDeviceMediatedDevicesInput
    output: ListPciDeviceMediatedDevicesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListPciDeviceMediatedDevicesInput {
    @required
    @httpLabel
    node: NodeName

    @required
    @httpLabel
    @jsonName("pciid")
    @documentation("The PCI device to get mediated devices for.")
    deviceId: String
}

@output
structure ListPciDeviceMediatedDevicesOutput {
    @required
    @jsonName("data")
    devices: PciMediatedDeviceSummaries
}

structure PciMediatedDeviceSummary {
    @required
    available: Integer

    @required
    description: String

    @required
    type: String
}

list PciMediatedDeviceSummaries {
    member: PciMediatedDeviceSummary
}