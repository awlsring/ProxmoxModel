$version: "2.0"

namespace awlsring.proxmox

@documentation("Ping the virtual machine. Requries the guest agent to be installed and active.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/agent/ping", code: 200)
operation PingVirtualMachine {
    input: PingVirtualMachineInput,
    output: PingVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure PingVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure PingVirtualMachineOutput {
    @required
    @jsonName("data")
    resp: PingResponse
}

structure PingResponse {}