$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the supported agent commands of the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-info", code: 200)
operation GetVirtualMachineAgentInfo {
    input: GetVirtualMachineAgentInfoInput,
    output: GetVirtualMachineAgentInfoOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineAgentInfoInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineAgentInfoOutput {
    @required
    @jsonName("data")
    result: GetInfoResult
}

structure GetInfoResult {
    @jsonName("result")
    summary: AgentInfoSummary
}

structure AgentInfoSummary {
    @required
    @jsonName("supported-commands")
    supportedCommands: CommandSummaries

    @required
    @jsonName("version")
    version: String
}

structure CommandSummary {
    @required
    @jsonName("name")
    name: String

    @required
    @jsonName("enabled")
    isEnabled: Boolean

    @required
    @jsonName("success-response")
    givesSuccessResponse: Boolean
}

list CommandSummaries {
    member: CommandSummary
}