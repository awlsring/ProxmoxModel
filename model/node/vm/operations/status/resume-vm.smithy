$version: "2.0"

namespace awlsring.proxmox

@documentation("Resume the specified virtual machine.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/status/resume", code: 200)
operation ResumeVirtualMachine {
    input: ResumeVirtualMachineInput,
    output: ResumeVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ResumeVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @jsonName("skiplock")
    skipLock: BooleanInteger

    @jsonName("nocheck")
    noCheck: BooleanInteger
}

@output
structure ResumeVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}