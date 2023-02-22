$version: "2.0"

namespace awlsring.proxmox

@documentation("Reset the specified virtual machine.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/status/reset", code: 200)
operation ResetVirtualMachine {
    input: ResetVirtualMachineInput,
    output: ResetVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ResetVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @jsonName("skiplock")
    skipLock: BooleanInteger
}

@output
structure ResetVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}