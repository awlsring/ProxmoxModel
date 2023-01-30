$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/hardware/pci", code: 200)
operation ListPciDevices {
    input: ListPciDevicesInput
    output: ListPciDevicesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListPciDevicesInput {
    @required
    @httpLabel
    node: NodeName

    @httpQuery("pci-class-blacklist")
    @documentation("Comma seperated list of PCI class IDs to exclude from the list")
    pciClassFilter: String

    @httpQuery("verbose")
    verbose: BooleanInteger
}

@output
structure ListPciDevicesOutput {
    @required
    @jsonName("data")
    devices: UsbDeviceSummaries
}

structure PciDeviceSummary {
    @required
    class: String

    @required
    device: String

    @required
    id: String

    @required
    @jsonName("iommugroup")
    iommuGroup: String

    @required
    vendor: String

    @jsonName("device_name")
    deviceName: String

    @jsonName("mdev")
    mdev: Boolean

    @jsonName("subsystem_device")
    subsystemDevice: String

    @jsonName("subsystem_vendor")
    subsystemVendor: String

    @jsonName("subsystem_device_name")
    subsystemDeviceName: String

    @jsonName("subsystem_vendor_name")
    subsystemVendorName: String

    @jsonName("vendor_name")
    vendorName: String
}

list PciDeviceSummaries {
    member: PciDeviceSummary
}