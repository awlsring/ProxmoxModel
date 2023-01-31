$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/apt/update", code: 200)
operation RefreshUpdates {
    input: RefreshUpdatesInput
    output: RefreshUpdatesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure RefreshUpdatesInput {
    @required
    @httpLabel
    node: NodeIdentifier,

    @httpQuery("notify")
    @documentation("Send a notification to the user. Ths is a boolean integer, 0 or 1.")
    notify: Integer,

    @httpQuery("quiet")
    @documentation("Only produce output for logging. Ths is a boolean integer, 0 or 1.")
    quiet: Integer,
}

@output
structure RefreshUpdatesOutput {
    @required
    @jsonName("data")
    result: String
}