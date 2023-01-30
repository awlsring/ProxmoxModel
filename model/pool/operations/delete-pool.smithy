$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/pools/{poolId}", code: 200)
operation DeletePool {
    input: DeletePoolInput
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeletePoolInput {
    @required
    @jsonName("poolid")
    @httpLabel
    poolId: PoolIdentifier,
}