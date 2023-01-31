$version: "2.0"

namespace awlsring.proxmox

@documentation("Create a Filesystem on an unused disk. Will be mounted under '/mnt/pve/NAME'.")
@http(method: "POST", uri: "/nodes/{node}/disks/directory", code: 200)
operation CreateDirectory {
    input: CreateDirectoryInput,
    output: CreateDirectoryOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure CreateDirectoryInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @documentation("The device to create the directory on.")
    device: DevicePath

    @required
    @documentation("The storage identifier.")
    name: String

    @jsonName("add_storage")
    @documentation("Configure storage using the directory. Takes a boolean integer value (0 false, 1 true).")
    addStorage: Integer

    @jsonName("filesystem")
    @documentation("Filesystem type. Can be ext4 or xfs.")
    fileSystem: DirectoryFileSystem
}

@output
structure CreateDirectoryOutput {
    @required
    @jsonName("data")
    output: String
}

enum DirectoryFileSystem {
    EXT4 = "ext4",
    XFS = "xfs"
}

