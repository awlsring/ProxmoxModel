$version: "2.0"

namespace awlsring.proxmox

@documentation("Reboot the specified virtual machine.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/status/reboot", code: 200)
operation RebootVirtualMachine {
    input: RebootVirtualMachineInput,
    output: RebootVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure RebootVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @jsonName("timeout")
    timeout: Integer
}

@output
structure RebootVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}