$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the memory block info on the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-memory-block-info", code: 200)
operation GetVirtualMachineMemoryBlockInformation {
    input: GetVirtualMachineMemoryBlockInformationInput,
    output: GetVirtualMachineMemoryBlockInformationOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineMemoryBlockInformationInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineMemoryBlockInformationOutput {
    @required
    @jsonName("data")
    result: GetMemoryBlockInformationResult
}

structure GetMemoryBlockInformationResult {
    @jsonName("size")
    size: Integer
}