$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/hardware/usb", code: 200)
operation ListUsbDevices {
    input: ListUsbDevicesInput
    output: ListUsbDevicesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListUsbDevicesInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure ListUsbDevicesOutput {
    @required
    @jsonName("data")
    devices: UsbDeviceSummaries
}

structure UsbDeviceSummary {
    @required
    @jsonName("busnum")
    busNumber: Integer

    @required
    @jsonName("devnum")
    deviceNumber: Integer

    @required
    @jsonName("level")
    level: Integer

    @required
    @jsonName("port")
    port: Integer

    @required
    @jsonName("prodid")
    productId: String

    @required
    @jsonName("vendid")
    vendorId: String

    @required
    speed: String

    manufacturer: String

    product: String

    serial: String

    @jsonName("usbpath")
    usbPath: String
}

list UsbDeviceSummaries {
    member: UsbDeviceSummary
}