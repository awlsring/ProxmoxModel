$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/nodes/{node}/apt/update", code: 200)
operation ListUpdates {
    input: ListUpdatesInput
    output: ListUpdatesOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ListUpdatesInput {
    @required
    @httpLabel
    node: NodeName,
}

@output
structure ListUpdatesOutput {
    @required
    @jsonName("data")
    updates: UpdateSummaries
}

structure UpdateSummary {
    @required
    @jsonName("Title")
    title: String,

    @required
    @jsonName("ChangeLogUrl")
    changeLogUrl: String,

    @required
    @jsonName("Priority")
    priority: String,

    @required
    @jsonName("OldVersion")
    oldVersion: String,

    @required
    @jsonName("Description")
    description: String,

    @required
    @jsonName("Arch")
    arch: String,

    @required
    @jsonName("Package")
    package: String

    @required
    @jsonName("Section")
    section: String,

    @required
    @jsonName("Version")
    version: String,

    @required
    @jsonName("Origin")
    origin: String
}

list UpdateSummaries {
    member: UpdateSummary
}