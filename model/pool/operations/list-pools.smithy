$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/pools", code: 200)
operation ListPools {
    output: ListPoolsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure ListPoolsOutput {
    @required
    @jsonName("data")
    pools: PoolInfoList
}

structure PoolInfo {
    @required
    @jsonName("poolid")
    poolId: PoolIdentifier,

    comment: String,
}

list PoolInfoList {
    member: PoolInfo
}