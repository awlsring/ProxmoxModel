$version: "2.0"

namespace awlsring.proxmox

@documentation("Get the hostname of the virtual machine. Requries the guest agent to be installed and active.")
@readonly
@http(method: "GET", uri: "/nodes/{node}/qemu/{vmId}/agent/get-host-name", code: 200)
operation GetVirtualMachineHostname {
    input: GetVirtualMachineHostnameInput,
    output: GetVirtualMachineHostnameOutput,
    errors: [
        InvalidInputError,
        InternalServerError,
        NoGuestAgentError
    ]
}

@input
structure GetVirtualMachineHostnameInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier
}

@output
structure GetVirtualMachineHostnameOutput {
    @required
    @jsonName("data")
    result: GetHostnameResult
}

structure GetHostnameResult {
    @jsonName("host-name")
    hostname: String
}