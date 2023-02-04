$version: "2.0"

namespace awlsring.proxmox

resource NetworkInterface {
    identifiers: { 
        node: NodeIdentifier, 
        interface: NetworkInterfaceIdentifier
    },
    read: GetNetworkInterface,
    list: ListNetworkInterfaces,
    create: CreateNetworkInterface,
    update: UpdateNetworkInterface,
    delete: DeleteNetworkInterface,
}

string NetworkInterfaceIdentifier

structure NetworkInterfaceSummary {
    @required
    @jsonName("iface")
    interface: NetworkInterfaceIdentifier

    @required
    @jsonName("type")
    interfaceType: NetworkInterfaceType

    @jsonName("method")
    ipAssignmentMethod: NetworkInterfaceMethod

    @jsonName("method6")
    ipv6AssignmentMethod: NetworkInterfaceMethod

    @jsonName("priority")
    startUpPriority: Integer

    @jsonName("families")
    families: StringList

    @jsonName("bond_mode")
    bondMode: NetworkInterfaceBondMode

    @jsonName("bond_xmit_hash_policy")
    bondXmitHashPolicy: NetworkInterfaceBondHashPolicy

    @jsonName("bond_miimon")
    bondMiimon: String

    @jsonName("slaves")
    interfaces: String

    @jsonName("autostart")
    autoStart: Integer

    @jsonName("active")
    isActive: Integer

    @jsonName("exists")
    exists: Integer

    @jsonName("bridge_vids")
    bridgeVids: String

    @jsonName("bridge_ports")
    bridgePorts: String

    @jsonName("bridge_fd")
    bridgeFd: String

    @jsonName("bridge_stp")
    bridgeStp: String

    @jsonName("bridge_vlan_aware")
    bridgeVlanAware: Integer

    @jsonName("address")
    ipv4Address: Ipv4Address

    @jsonName("gateway")
    ipv4Gateway: Ipv4Address

    @jsonName("gateway6")
    ipv6Gateway: Ipv6Address

    netmask: String

    @jsonName("cidr")
    ipv4Cidr: Ipv4AddressWithCIDR

    @jsonName("cidr6")
    ipv6Cidr: String

    @jsonName("address6")
    ipv6Address: Ipv6Address
}

list NetworkInterfaceSummaries {
    member: NetworkInterfaceSummary
}

enum NetworkInterfaceMethod {
    METHOD = "manual",
    STATIC = "static",
    NONE = "none",
    DHCP = "dhcp",
    IPV6_AUTO_CONF = "ipv6_autoconf",
}

enum NetworkInterfaceBondMode {
    BALANCE_RR = "balance-rr",
    ACTIVE_BACKUP = "active-backup",
    BALANCE_XOR = "balance-xor",
    BROADCAST = "broadcast",
    IEEE_802_3AD = "802.3ad",
    BALANCE_TLB = "balance-tlb",
    BALANCE_ALB = "balance-alb",
    BALANCE_SLB = "balance-slb",
    LACP_BALANCE_SLB = "lacp-balance-slb",
    LACP_BALANCE_TCP = "lacp-balance-tcp",
}

enum NetworkInterfaceBondHashPolicy {
    LAYER2 = "layer2",
    LAYER2_3 = "layer2+3",
    LAYER3_4 = "layer3+4",
}

enum NetworkInterfaceType {
    BRIDGE = "bridge",
    BOND = "bond",
    ETHERNET = "eth",
    ALIAS = "alias",
    VLAN = "vlan",
    OVS_BRIDGE = "OVSBridge",
    OVS_BOND = "OVSBond",
    OVS_PORT = "OVSPort",
    OVS_INT_PORT = "OVSIntPort",
    UNKNOWN = "unknown",
}

@pattern("^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?).){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$")
string Ipv4Address

@pattern("^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?).){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\/(3[0-2]|[1-2][0-9]|[0-9])$")
string Ipv4AddressWithCIDR

@pattern("^([a-f0-9:]+:+)+[a-f0-9]+$")
string Ipv6Address