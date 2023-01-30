$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/pools", code: 200)
operation CreatePool {
    input: CreatePoolInput
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreatePoolInput {
    @required
    @jsonName("poolid")
    poolId: PoolIdentifier,

    comment: String
}