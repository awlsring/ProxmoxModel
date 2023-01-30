$version: "2.0"

namespace awlsring.proxmox

resource Pool {
    identifiers: { poolId: PoolIdentifier },
    read: GetPool,
    list: ListPools,
    update: ModifyPool,
    delete: DeletePool,
    operations: [ CreatePool ]
}

string PoolIdentifier