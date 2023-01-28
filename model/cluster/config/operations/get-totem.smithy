$version: "2.0"

namespace awlsring.proxmox

@readonly
@http(method: "GET", uri: "/cluster/config/totem", code: 200)
operation GetClusterTotemSettings {
    output: GetClusterTotemSettingsOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@output
structure GetClusterTotemSettingsOutput {
    @documentation("Totem summary")
    @jsonName("data")
    totem: TotemSummary
}