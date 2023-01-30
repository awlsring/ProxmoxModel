$version: "2.0"

namespace awlsring.proxmox

@idempotent
@http(method: "DELETE", uri: "/storage/{storage}", code: 200)
operation DeleteStorage {
    input: DeleteStorageInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DeleteStorageInput {
    @required
    @httpLabel
    storage: StorageName
}