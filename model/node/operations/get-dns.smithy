$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/dns", code: 200)
operation GetNodeDns {
    input: GetNodeDnsInput,
    output: GetNodeDnsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetNodeDnsInput {
    @required
    @httpLabel
    node: NodeIdentifier
}

@output
structure GetNodeDnsOutput {
    @required
    @jsonName("data")
    summary: NodeDnsSummary
}

structure NodeDnsSummary {
    dns1: String
    
    dns2: String
    
    dns3: String

    @jsonName("search")
    searchDomain: String
}