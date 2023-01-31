$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/network/{interface}", code: 200)
operation GetNetworkInterface {
    input: GetNetworkInterfaceInput,
    output: GetNetworkInterfaceOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetNetworkInterfaceInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("iface")
    interface: NetworkInterfaceIdentifier
}

@output
structure GetNetworkInterfaceOutput {
    @required
    @jsonName("data")
    summary: NetworkInterfaceSummary
}