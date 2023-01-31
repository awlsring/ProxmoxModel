$version: "2.0"

namespace awlsring.proxmox

@documentation("Unlink/delete disk images.")
@idempotent
@http(method: "PUT", uri: "/nodes/{node}/qemu/{vmId}/unlink", code: 200)
operation UnlinkVirtualMachineDisks {
    input: UnlinkVirtualMachineDisksInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure UnlinkVirtualMachineDisksInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @required
    @httpQuery("idlist")
    @jsonName("idlist")
    @documentation("A list of disk ids to unlink.")
    diskIds: String

    @required
    @httpQuery("force")
    @jsonName("force")
    @documentation("Fore removal of disk. Without this, the disk is replaced with a disk entry of 'unused[n]'.")
    forceRemoval: Boolean
}
