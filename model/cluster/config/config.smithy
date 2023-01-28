$version: "2.0"

namespace awlsring.proxmox

resource Config {
    operations: [ CreateClusterConfig, GetClusterJoinInformation, JoinCluster, GetClusterApiVersion, GetClusterTotemSettings ]
    resources: [ CorosyncNode ]
}