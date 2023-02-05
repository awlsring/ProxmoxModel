$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the network interface information of the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/network-get-interfaces", code: 200)
operation GetVirtualMachineNetworkInterfaces {
    input: GetVirtualMachineNetworkInterfacesInput,
    output: GetVirtualMachineNetworkInterfacesOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineNetworkInterfacesInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineNetworkInterfacesOutput {
    @required
    @jsonName("data")
    result: GetVirtualNetworkInterfacesResult
}

structure GetVirtualNetworkInterfacesResult {
    @jsonName("result")
    summary: VirtualNetworkInterfaceSummaries
}

structure VirtualNetworkInterfaceSummary {
    @jsonName("name")
    name: String

    @jsonName("statistics")
    statistics: NetworkInterfaceStatisticsSummary

    @jsonName("ip-addresses")
    ipAddresses: NetworkInterfaceIpAddressSummaries

    @jsonName("hardware-address")
    hardwareAddress: String
}

list VirtualNetworkInterfaceSummaries {
    member: VirtualNetworkInterfaceSummary
}

structure NetworkInterfaceIpAddressSummary {
    @jsonName("ip-address")
    address: String

    @jsonName("ip-address-type")
    type: String

    @jsonName("prefix")
    prefix: Integer
}

list NetworkInterfaceIpAddressSummaries {
    member: NetworkInterfaceIpAddressSummary
}

structure NetworkInterfaceStatisticsSummary {
    @jsonName("rx-bytes")
    receivedBytes: Long

    @jsonName("rx-dropped")
    receivedDropped: Long

    @jsonName("rx-errs")
    receivedErrors: Long

    @jsonName("rx-packets")
    receivedPackets: Long

    @jsonName("tx-bytes")
    transmittedBytes: Long

    @jsonName("tx-dropped")
    transmittedDropped: Long

    @jsonName("tx-errs")
    transmittedErrors: Long

    @jsonName("tx-packets")
    transmittedPackets: Long
}
