$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "PUT", uri: "/pools/{poolId}", code: 200)
operation ModifyPool {
    input: ModifyPoolInput
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ModifyPoolInput {
    @required
    @httpLabel
    @jsonName("poolid")
    poolId: PoolIdentifier,

    comment: String

    @documentation("Remove storage and vms in request rather than adding.")
    delete: Boolean

    @documentation("List of storage identifiers to add to the pool.")
    storage: String

    @documentation("List of VM identifiers to add to the pool.")
    vms: String
}