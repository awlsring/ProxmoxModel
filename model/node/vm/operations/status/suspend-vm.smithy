$version: "2.0"

namespace awlsring.proxmox

@documentation("Suspend the specified virtual machine.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/status/suspend", code: 200)
operation SuspendVirtualMachine {
    input: SuspendVirtualMachineInput,
    output: SuspendVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure SuspendVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @jsonName("skiplock")
    skipLock: BooleanInteger

    @jsonName("statestorage")
    stateStorage: BooleanInteger

    @jsonName("todisk")
    suspendToDisk: BooleanInteger
}

@output
structure SuspendVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}