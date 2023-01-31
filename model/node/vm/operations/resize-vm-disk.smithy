$version: "2.0"

namespace awlsring.proxmox

@documentation("Extend the volume size of a virtual machine disk.")
@idempotent
@http(method: "PUT", uri: "/nodes/{node}/qemu/{vmId}/resize", code: 200)
operation ResizeVirtualMachineDisk {
    input: ResizeVirtualMachineDiskInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ResizeVirtualMachineDiskInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @required
    @httpQuery("disk")
    @jsonName("disk")
    @documentation("The name of the disk to resize.")
    disk: VirtualMachineDiskTarget

    @required
    @httpQuery("size")
    @jsonName("size")
    @documentation("The new size of the disk in bytes, or with a suffix of K, M, G, or T for kilobytes, megabytes, gigabytes, or terabytes. If + is specified, the size is increased by the given amount.")
    size: VirtualMachineDiskSize

    @httpQuery("digest")
    @jsonName("digest")
    @documentation("The SHA1 digest of the current configuration. Used to prevent concurrent operations.")
    digest: String

    @httpQuery("skiplock")
    @jsonName("skiplock")
    @documentation("Ignore lock. Only valid if authenticated as root user.")
    skipLock: Boolean
}

@pattern("^+?d+(.d+)?[KMGT]?$")
string VirtualMachineDiskSize