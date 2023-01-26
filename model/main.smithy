$version: "2.0"

namespace awlsring.proxmox

use aws.protocols#restJson1
@title("Proxmox")

@restJson1
@httpApiKeyAuth(scheme: "ApiKey", name: "Authorization", in: "header")
@paginated(
    inputToken: "nextToken",
    outputToken: "nextToken",
    pageSize: "pageSize"
)
service Proxmox {
    version: "2023-01-01",
    resources: [ Node, Storage ],
    operations: [ GetVersion ]
}