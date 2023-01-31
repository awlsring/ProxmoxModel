$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/nodes/{node}/network", code: 200)
operation ApplyNetworkInterfaceConfiguration {
    input: ApplyNetworkInterfaceConfigurationInput,
    output: ApplyNetworkInterfaceConfigurationOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ApplyNetworkInterfaceConfigurationInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure ApplyNetworkInterfaceConfigurationOutput {
    @required
    data: String
}