$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the vcpus of the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-vcpus", code: 200)
operation GetVirtualMachineVcpus {
    input: GetVirtualMachineVcpusInput,
    output: GetVirtualMachineVcpusOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineVcpusInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineVcpusOutput {
    @required
    @jsonName("data")
    result: GetVcpusResult
}

structure GetVcpusResult {
    @jsonName("result")
    summaries: VcpuSummaries
}

structure VcpuSummary {
    @jsonName("online")
    online: Boolean

    @jsonName("can-offline")
    canOffline: Boolean

    @jsonName("logical-id")
    logicalId: Integer
}

list VcpuSummaries {
    member: VcpuSummary
}