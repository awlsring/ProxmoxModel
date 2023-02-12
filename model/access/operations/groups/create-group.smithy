$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/access/groups", code: 200)
operation CreateGroup {
    input: CreateGroupInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateGroupInput {
    @required
    @jsonName("groupid")
    groupId: GroupIdentifier

    @jsonName("comment")
    comments: String
}
