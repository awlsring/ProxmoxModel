$version: "2.0"

namespace awlsring.proxmox

@documentation("Shutdown the specified virtual machine cleanly.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/status/shutdown", code: 200)
operation ShutdownVirtualMachine {
    input: ShutdownVirtualMachineInput,
    output: ShutdownVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ShutdownVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @jsonName("timeout")
    timeout: Integer

    @jsonName("skiplock")
    skipLock: BooleanInteger

    @jsonName("foreStop")
    @documentation("Ensure the virtual machine stops.")
    forceStop: BooleanInteger

    @jsonName("keepActive")
    @documentation("Keep the storage active after Shutdownping it.")
    keepStorageActive: BooleanInteger
}

@output
structure ShutdownVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}