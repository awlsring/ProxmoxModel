$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/nodes/{node}/dns", code: 200)
operation UpdateNodeDns {
    input: UpdateNodeDnsInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure UpdateNodeDnsInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpQuery("search")
    @jsonName("search")
    searchDomain: String

    @jsonName("dns1")
    dns1: String

    @jsonName("dns2")
    dns2: String

    @jsonName("dns3")
    dns3: String
}