$version: "2.0"

namespace awlsring.proxmox

@documentation("Execute a command on the virtual machine. Requries the guest agent to be installed and active.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/agent/exec", code: 200)
operation VirtualMachineExecuteCommand {
    input: VirtualMachineExecuteCommandInput,
    output: VirtualMachineExecuteCommandOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure VirtualMachineExecuteCommandInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    command: String

    @jsonName("input-data")
    inputData: String
}

@output
structure VirtualMachineExecuteCommandOutput {
    @required
    @jsonName("data")
    response: ExecuteCommandResponse
}

structure ExecuteCommandResponse {
    @required
    @jsonName("pid")
    processId: Integer
}