$version: "2.0"

namespace awlsring.proxmox

resource Apt {
    identifiers: {
        node: NodeName
    }
    operations: [
        GetPackageChangelog,
        ListRepositoriesInformation,
        ChangeRepositoryProperties,
        AddRepository,
        ListUpdates,
        ListPackages
    ]
}