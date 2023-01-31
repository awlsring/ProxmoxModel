$version: "2.0"

namespace awlsring.proxmox

@documentation("Create a copy of a virtual machine or template.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/clone", code: 200)
operation CloneVirtualMachine {
    input: CloneVirtualMachineInput,
    output: CloneVirtualMachineOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CloneVirtualMachineInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @required
    @jsonName("newid")
    newId: VirtualMachineIdentifierInteger

    @jsonName("bwlimit")
    @documentation("Override deafult bandwidth limit in KiB/s")
    bandwidthLimit: Integer

    @jsonName("description")
    @documentation("Set a description for the new VM")
    description: String

    @jsonName("full")
    @documentation("Create a full clone with all copy of disks.")
    fullClone: Boolean

    @jsonName("name")
    @documentation("Set a name for the new VM")
    name: String

    @jsonName("format")
    @documentation("Set the disk format for the new VM. Only valid for full clones.")
    diskFormat: CloneVirtualMachineDiskFormat

    @jsonName("storage")
    @documentation("Set the storage for the new VM. Only valid for full clones.")
    storage: StorageIdentifier

    @jsonName("target")
    @documentation("Set the target node for the new VM. Only valid if the original VM is on shared storage.")
    targetNode: NodeIdentifier

    @jsonName("snapname")
    @documentation("Set the snapshot name for the new VM.")
    snapshotName: String

    @jsonName("pool")
    @documentation("Add the VM to a resource pool.")
    pool: PoolIdentifier
}

@output
structure CloneVirtualMachineOutput {
    @required
    @jsonName("data")
    result: String
}

enum CloneVirtualMachineDiskFormat {
    RAW = "raw",
    QCOW2 = "qcow2",
    VMDK = "vmdk",
}