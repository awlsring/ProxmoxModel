$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/access/groups/{groupId}", code: 200)
operation GetGroupDetails {
    input: GetGroupDetailsInput,
    output: GetGroupDetailsOutput
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetGroupDetailsInput {
    @required
    @httpLabel
    @jsonName("groupid")
    groupId: GroupIdentifier
}

@output
structure GetGroupDetailsOutput {
    @required
    @jsonName("data")
    summary: GroupDetailsSummary
}

structure GroupDetailsSummary {
    @required
    @jsonName("users")
    users: StringList,

    @jsonName("comment")
    comments: String,
}