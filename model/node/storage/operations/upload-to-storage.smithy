$version: "2.0"

namespace awlsring.proxmox

@http(method: "POST", uri: "/nodes/{node}/storage/{storage}/upload", code: 200)
operation UploadToStorage {
    input: UploadToStorageInput
    output: UploadToStorageOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure UploadToStorageInput {
    @required
    @httpLabel
    @jsonName("node")
    node: NodeIdentifier,

    @required
    @httpLabel
    @jsonName("storage")
    storage: StorageIdentifier,

    @required
    @jsonName("content")
    contentType: UploadContentType,

    @required
    @documentation("The name of the file to create.")
    @jsonName("filename")
    filename: String,

    @jsonName("checksum")
    @documentation("The expceted checksum of the file.")
    checksum: String,

    @jsonName("checksum-algorithm")
    @documentation("The expceted checksum of the file.")
    checksumAlgorithm: ChecksumAlgorithm,

    @jsonName("tmpfilename")
    @documentation("The source filename.")
    tempFilename: String,
}

@output
structure UploadToStorageOutput {
    @required
    @jsonName("data")
    result: String
}