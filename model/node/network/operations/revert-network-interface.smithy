$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/network", code: 200)
operation RevertNetworkInterfaceConfiguration {
    input: RevertNetworkInterfaceConfigurationInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure RevertNetworkInterfaceConfigurationInput {
    @required
    @httpLabel
    node: NodeName
}