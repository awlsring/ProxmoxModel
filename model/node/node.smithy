$version: "2.0"

namespace awlsring.proxmox

resource Node {
    identifiers: { node: NodeIdentifier },
    list: ListNodes,
    resources: [ 
        VirtualMachine,
        NetworkInterface,
        Capabilities,
        Disks,
        Apt,
        Certificate,
        Hardware,
        NodeStorage,
        CephMonitor,
        CephManager
    ],
    operations: [ 
        ApplyNetworkInterfaceConfiguration, 
        RevertNetworkInterfaceConfiguration 
        GetNodeDns,
        UpdateNodeDns,
        InitCephCluster
    ]
}

@pattern("^[A-Za-z]+$")
string NodeIdentifier

list NodeIdentifiers {
    member: NodeIdentifier
}

structure NodeSummary {
    @required
    @documentation("The name of the node")
    node: NodeIdentifier,

    @jsonName("maxmem")
    @documentation("Max memory allocated in bytes")
    maxMemory: Long,

    @jsonName("mem")
    @documentation("Current memory utilization in bytes")
    memory: Long,

    @documentation("Current disk utilization in bytes")
    disk: Long,

    @jsonName("maxdisk")
    @documentation("Max disk space available in bytes")
    maxDisk: Long,

    @jsonName("maxcpu")
    @documentation("Amount of CPU cores available on node")
    cores: Integer,

    @jsonName("id")
    @documentation("The node id. This is a string of 'node/<name>'")
    nodeId: String,

    @jsonName("level")
    @documentation("The node's support level")
    supportLevel: String,

    @jsonName("ssl_fingerprint")
    sslFingerprint: String,

    @documentation("The system type. Seems to be always node")
    type: String,

    @jsonName("cpu")
    @documentation("The virtual machines cpu utilization in percent")
    cpuUtilization: Float,

    @documentation("The node's uptime in seconds")
    uptime: Long,

    @documentation("The node's status")
    status: NodeStatus,
}

enum NodeStatus {
    ONLINE = "online",
    STOPPED = "offline",
}

list NodeSummaries {
    member: NodeSummary
}