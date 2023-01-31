$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the memory blocks on the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-memory-blocks", code: 200)
operation GetVirtualMachineMemoryBlocks {
    input: GetVirtualMachineMemoryBlocksInput,
    output: GetVirtualMachineMemoryBlocksOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineMemoryBlocksInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineMemoryBlocksOutput {
    @required
    @jsonName("data")
    result: GetMemoryBlocksResult
}

structure GetMemoryBlocksResult {
    @jsonName("result")
    summaries: MemoryBlockSummaries
}

structure MemoryBlockSummary {
    online: Boolean

    @jsonName("can-offline")
    canOffline: Boolean

    @jsonName("phys-index")
    physicalIndex: Integer
}

list MemoryBlockSummaries {
    member: MemoryBlockSummary
}