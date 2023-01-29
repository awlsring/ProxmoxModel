$version: "2.0"

namespace awlsring.proxmox

@documentation("List all custom and default CPU models.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/capabilities/qemu/cpu", code: 200)
operation ListCpuCapabilities {
    input: ListCpuCapabilitiesInput,
    output: ListCpuCapabilitiesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListCpuCapabilitiesInput {
    @required
    @httpLabel
    node: NodeName
}

@output
structure ListCpuCapabilitiesOutput {
    @required
    @jsonName("data")
    summaries: CpuCapabilitySummaries
}

structure CpuCapabilitySummary {
    @required
    custom: Integer,

    @required
    vendor: String,

    @required
    name: String,
}

list CpuCapabilitySummaries {
    member: CpuCapabilitySummary
}