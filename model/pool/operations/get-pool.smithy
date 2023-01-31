$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/pools/{poolId}", code: 200)
operation GetPool {
    input: GetPoolInput
    output: GetPoolOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure GetPoolInput {
    @required
    @httpLabel
    @jsonName("poolid")
    poolId: PoolIdentifier,

    @httpQuery("type")
    type: PoolMemberType
}

@output
structure GetPoolOutput {
    @required
    @jsonName("data")
    pools: PoolInfoList
}

structure PoolConfiguration {
    @required
    @jsonName("members")
    poolMembers: PoolMembers,

    comment: String,
}

structure PoolMember {
    id: String

    disk: Integer,
    
    uptime: Long,
    
    @jsonName("maxmem")
    maxMemory: Long,

    @jsonName("netin")
    networkIn: Long,

    @jsonName("netout")
    networkOut: Long,

    @jsonName("diskwrite")
    diskWrite: Long,

    @jsonName("diskread")
    diskRead: Long,

    @jsonName("maxdisk")
    maxDisk: Long,

    @jsonName("cpu")
    cpuUtilization: Float,

    @jsonName("maxcpu")
    cpuCount: Integer,

    @jsonName("vmid")
    vmId: Integer,

    @jsonName("mem")
    memory: Long,

    name: String

    @jsonName("template")
    @documentation("Whether the VM is a template. This is a boolean integer, where 1 is true and 0 is false.")
    isTemplate: Integer

    @jsonName("node")
    node: NodeIdentifier,

    type: PoolMemberType,

    status: String
}

list PoolMembers {
    member: PoolMember
}

enum PoolMemberType {
    QEMU = "qemu",
    LXC = "lxc",
    STORAGE = "storage",
}