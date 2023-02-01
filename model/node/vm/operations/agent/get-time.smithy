$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the time of the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-time", code: 200)
operation GetVirtualMachineTime {
    input: GetVirtualMachineTimeInput,
    output: GetVirtualMachineTimeOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineTimeInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineTimeOutput {
    @required
    @jsonName("data")
    result: GetTimeResult
}

structure GetTimeResult {
    @jsonName("result")
    time: Integer
}