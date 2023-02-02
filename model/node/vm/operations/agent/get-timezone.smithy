$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the time of the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-timezone", code: 200)
operation GetVirtualMachineTimeZone {
    input: GetVirtualMachineTimeZoneInput,
    output: GetVirtualMachineTimeZoneOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineTimeZoneInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineTimeZoneOutput {
    @required
    @jsonName("data")
    result: GetTimeZoneResult
}

structure GetTimeZoneResult {
    @jsonName("result")
    summary: TimeZoneSummary
}

structure TimeZoneSummary {
    @jsonName("zone")
    zone: String

    @jsonName("offset")
    offset: Integer
}