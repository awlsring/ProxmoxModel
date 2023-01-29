$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/access/ticket", code: 200)
operation CreateTicket {
    input: CreateTicketInput,
    output: CreateTicketOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateTicketInput {
    @required
    @jsonName("username")
    username: String,

    @required
    @jsonName("password")
    password: String,

    @jsonName("realm")
    realm: String,
}

@output
structure CreateTicketOutput {
    @required
    @jsonName("data")
    ticket: Ticket
}

structure Ticket {
    @required
    username: String

    @jsonName("cap")
    capabilities: CapabilityMap

    @jsonName("CSRFPreventionToken")
    csrfToken: String

    ticket: String

    @jsonName("clustername")
    clusterName: String
}

map CapabilityCategoryMap {
    key: String,
    value: Integer
}

map CapabilityMap {
    key: String,
    value: CapabilityCategoryMap
}