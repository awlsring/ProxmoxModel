$version: "2.0"

namespace awlsring.proxmox

@documentation("Get available QEMU/KVM machine types.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/capabilities/qemu/machines", code: 200)
operation ListMachineCapabilities {
    input: ListMachineCapabilitiesInput,
    output: ListMachineCapabilitiesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListMachineCapabilitiesInput {
    @required
    @httpLabel
    node: NodeName
}

@output
structure ListMachineCapabilitiesOutput {
    @required
    @jsonName("data")
    summaries: MachineCapabilitySummaries
}

structure MachineCapabilitySummary {
    @required
    id: String,

    @required
    type: MachineType,

    @required
    version: String,
}

list MachineCapabilitySummaries {
    member: MachineCapabilitySummary
}

enum MachineType {
    Q35 = "q35",
    I440FX = "i440fx"
}