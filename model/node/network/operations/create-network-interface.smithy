$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/network", code: 200)
operation CreateNetworkInterface {
    input: CreateNetworkInterfaceInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateNetworkInterfaceInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @jsonName("iface")
    name: NetworkInterfaceIdentifier

    @required
    type: NetworkInterfaceType

    @jsonName("address")
    ipv4Address: Ipv4Address

    @jsonName("address6")
    ipv6Address: Ipv6Address

    @jsonName("autostart")
    autoStart: Boolean

    @jsonName("bond_primary")
    bondPrimary: NetworkInterfaceIdentifier

    @jsonName("bond_mode")
    bondMode: NetworkInterfaceBondMode

    @jsonName("bond_xmit_hash_policy")
    bondXmitHashPolicy: NetworkInterfaceBondHashPolicy

    @jsonName("bridge_ports")
    bridgePorts: String
    
    @jsonName("bridge_vlan_aware")
    bridgeVlanAware: Boolean
    
    @jsonName("cidr")
    ipv4Cidr: Ipv4AddressWithCIDR
    
    @jsonName("cidr6")
    ipv6Cidr: String

    @jsonName("comments")
    ipv4Comments: String

    @jsonName("comments6")
    ipv6Comments: String

    @jsonName("gateway")
    ipv4Gateway: Ipv4Address

    @jsonName("gateway6")
    ipv6Gateway: Ipv6Address

    mtu: Integer

    @jsonName("netmask")
    ipv4Netmask: Ipv4Address

    @jsonName("netmask6")
    ipv6Netmask: String

    @jsonName("ovs_bonds")
    ovsBonds: String

    @jsonName("ovs_options")
    ovsOptions: String

    @jsonName("ovs_ports")
    ovsPorts: String

    @jsonName("ovs_tag")
    ovsTag: Integer

    @jsonName("ovs_bridge")
    ovsBridge: String

    @jsonName("slaves")
    interfaces: String

    @jsonName("vlan-id")
    vlanId: Integer

    @jsonName("vlan-raw-device")
    vlanRawDevice: NetworkInterfaceIdentifier
}