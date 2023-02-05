$version: "2.0"

namespace awlsring.proxmox

@documentation("Download a file from a URL to the specified storage.")
@http(method: "POST", uri: "/nodes/{node}/storage/{storage}/download-url", code: 200)
operation DownloadFromUrlToStorage {
    input: DownloadFromUrlToStorageInput
    output: DownloadFromUrlToStorageOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure DownloadFromUrlToStorageInput {
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

    @required
    @documentation("The URL to download from.")
    @jsonName("url")
    url: String,

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
structure DownloadFromUrlToStorageOutput {
    @required
    @jsonName("data")
    result: String
}