$version: "2.0"

namespace awlsring.proxmox

resource ZFS {
    identifiers: {
        node: NodeName
    },
    operations: [ CreateZFSPool, ListZFSPools, DeleteZFSPool, GetZFSPoolStatus ]
}

structure ZFSPoolSummary {
    @required
    @jsonName("alloc")
    @documentation("The allocated space on the pool in bytes")
    allocated: Long

    @required
    @jsonName("dedup")
    deduplication: Integer

    @required
    @jsonName("frag")
    fragmentation: Integer

    @required
    @documentation("The health of the pool")
    health: String

    @required
    @documentation("The free space on the pool in bytes")
    free: Long

    @required
    @documentation("The total size of the pool in bytes")
    size: Long

    @required
    @documentation("Name of the pool")
    name: String
}

list ZFSPoolSummaries {
    member: ZFSPoolSummary
}

enum ZFSRaidLevel {
    SINGLE = "single"
    MIRROR = "mirror"
    RAID_Z = "raidz"
    RAID_Z2 = "raidz2"
    RAID_Z3 = "raidz3"
    RAID_10 = "raid10"
    DRAID = "draid"
    DRAID_2 = "draid2"
    DRAID_3 = "draid3"
}

enum ZFSCompression {
    ON = "on"
    OFF = "off"
    LZ4 = "lz4"
    LZJB = "lzjb"
    GZIP = "gzip"
    ZLE = "zle"
    ZSTD = "zstd"
}