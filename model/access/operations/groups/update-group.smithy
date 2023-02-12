$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/access/groups/{groupId}", code: 200)
operation UpdateGroup {
    input: UpdateGroupInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure UpdateGroupInput {
    @required
    @httpLabel
    @jsonName("groupid")
    groupId: GroupIdentifier

    @jsonName("comment")
    comments: String
}
