$version: "2.0"

namespace awlsring.proxmox

@documentation("Create a copy of a virtual machine or template.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/template", code: 200)
operation CreateVirtualMachineTemplate {
    input: CreateVirtualMachineTemplateInput,
    output: CreateVirtualMachineTemplateOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateVirtualMachineTemplateInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @jsonName("disk")
    @documentation("The disk to convert to a template.")
    diskToCovert: VirtualMachineDiskTarget
}

@output
structure CreateVirtualMachineTemplateOutput {
    @jsonName("data")
    result: String
}