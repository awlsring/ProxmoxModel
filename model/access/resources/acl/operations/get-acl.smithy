$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/access/acl", code: 200)
operation GetAccessControlList {
    output: GetAccessControlListOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure GetAccessControlListOutput {
    @required
    @jsonName("data")
    summaries: AccessControlSummaries
}