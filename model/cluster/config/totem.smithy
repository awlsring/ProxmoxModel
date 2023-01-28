$version: "2.0"

namespace awlsring.proxmox

structure TotemSummary {
    @jsonName("secauth")
    secureAuth: String

    version: String

    interface: LinkMap

    @jsonName("link_mode")
    linkMode: String

    @jsonName("ip_version")
    ipVersion: String

    @jsonName("config_version")
    configVersion: String

    @jsonName("cluster_name")
    clusterName: String
}

map LinkMap {
    key: String,
    value: LinkSummary
}

structure LinkSummary {
    @jsonName("linknumber")
    linkNumber: String
}