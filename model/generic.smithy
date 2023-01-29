$version: "2.0"

namespace awlsring.proxmox

list StringList {
    member: String
}

@pattern("^[a-fA-F0-9-]+$")
string UUID