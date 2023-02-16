$version: "2.0"

namespace awlsring.proxmox

@documentation("Get a command status of an execution started on the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/exec-status", code: 200)
operation GetVirtualMachineCommandStatus {
    input: GetVirtualMachineCommandStatusInput,
    output: GetVirtualMachineCommandStatusOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineCommandStatusInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @required
    @httpQuery("pid")
    @jsonName("pid")
    processId: Integer
}

@output
structure GetVirtualMachineCommandStatusOutput {
    @required
    @jsonName("data")
    summary: CommandStatusSummary
}

structure CommandStatusSummary {
    @required
    @jsonName("exited")
    exited: Boolean

    @jsonName("err-data")
    errorData: String
    
    @jsonName("err-truncated")
    errorTruncated: Boolean

    @jsonName("exitcode")
    exitCode: Integer

    @jsonName("out-data")
    outputData: String

    @jsonName("out-truncated")
    outputTruncated: Boolean

    @jsonName("signal")
    signal: Integer
}

