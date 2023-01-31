$version: "2.0"

namespace awlsring.proxmox

@documentation("Wipe a disk or partition. Requires to be authenticated as the node root user.")
@idempotent
@http(method: "PUT", uri: "/nodes/{node}/disks/smart", code: 200)
operation WipeDisk {
    input: WipeDiskInput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure WipeDiskInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @httpQuery("disk")
    @documentation("Disk to wipe.")
    disk: DevicePath,
}