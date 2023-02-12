$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/access/groups/{groupId}", code: 200)
operation DeleteGroup {
    input: DeleteGroupInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteGroupInput {
    @required
    @httpLabel
    @jsonName("groupid")
    groupId: GroupIdentifier
}
