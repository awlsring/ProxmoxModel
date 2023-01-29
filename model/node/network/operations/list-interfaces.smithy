$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/network", code: 200)
operation ListNetworkInterfaces {
    input: ListNetworkInterfacesInput,
    output: ListNetworkInterfacesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListNetworkInterfacesInput {
    @required
    @httpLabel
    node: NodeName

    @httpQuery("type")
    type: NetworkInterfaceType
}

@output
structure ListNetworkInterfacesOutput {
    @required
    @jsonName("data")
    summaries: NetworkInterfaceSummaries
}