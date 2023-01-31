$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu", code: 200)
operation ListVirtualMachines {
    input: ListVirtualMachinesInput,
    output: ListVirtualMachinesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListVirtualMachinesInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure ListVirtualMachinesOutput {
    @required
    @jsonName("data")
    summaries: VirtualMachineSummaries
}