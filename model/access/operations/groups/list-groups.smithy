$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/access/groups", code: 200)
operation ListGroups {
    output: ListGroupsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure ListGroupsOutput {
    @required
    @jsonName("data")
    summaries: GroupSummaries
}

structure GroupSummary {
    @required
    @jsonName("groupid")
    groupId: GroupIdentifier,

    @jsonName("users")
    users: String,

    @jsonName("comment")
    comments: String,
}

list GroupSummaries {
    member: GroupSummary
}