$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/nodes/{node}/network/{interface}", code: 200)
operation DeleteNetworkInterface {
    input: DeleteNetworkInterfaceInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteNetworkInterfaceInput {
    @required
    @httpLabel
    node: NodeName

    @required
    @httpLabel
    @jsonName("iface")
    interface: NetworkInterfaceIdentifier
}