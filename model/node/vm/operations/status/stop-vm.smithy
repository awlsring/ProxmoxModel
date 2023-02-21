$version: "2.0"

namespace awlsring.proxmox

@documentation("Stop the specified virtual machine without graceful shutdown.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/status/stop", code: 200)
operation StopVirtualMachine {
    input: StopVirtualMachineInput,
    output: StopVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure StopVirtualMachineInput {
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

    @jsonName("migratedfrom")
    @documentation("Specify migrated from node.")
    migratedFrom: String

    @jsonName("keepActive")
    @documentation("Keep the storage active after stopping it.")
    keepStorageActive: BooleanInteger
}

@output
structure StopVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}