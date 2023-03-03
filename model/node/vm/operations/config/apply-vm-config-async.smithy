$version: "2.0"

namespace awlsring.proxmox

@documentation("Set the virtual machine configuration asynchronously.")
@http(method: "POST", uri: "/nodes/{node}/qemu/{vmId}/config", code: 200)
operation ApplyVirtualMachineConfigurationAsync {
    input: ApplyVirtualMachineConfigurationAsyncInput,
    output: ApplyVirtualMachineConfigurationAsyncOutput,
    errors: [
        InvalidInputError,
        InternalServerError
    ]
}

@input
structure ApplyVirtualMachineConfigurationAsyncInput {
    @required
    @httpLabel
    node: NodeIdentifier

    @required
    @httpLabel
    @jsonName("vmid")
    vmId: VirtualMachineIdentifier

    @jsonName("acpi")
    @documentation("Enable ACPI support. Default to enabled.")
    acpi: BooleanInteger

    @jsonName("affinity")
    @documentation("List of cores to execute processes. Example value: 1,5,8-11.")
    affinity: String

    @jsonName("agent")
    @documentation("The QEMU agent and its configuration.")
    agent: String

    @jsonName("arch")
    @documentation("The architecture of the virtual machine.")
    architecture: VirtualMachineArchitecture

    @jsonName("args")
    @documentation("Additional command line arguments passed to the kvm.")
    kvmArguments: String

    @jsonName("audio0")
    @documentation("The audio device and its configuration.")
    audio: String

    @jsonName("autostart")
    @documentation("Start the virtual machine on crash.")
    autostart: BooleanInteger

    @jsonName("ballon")
    @documentation("Amount of RAM for the VM in MB.")
    ballon: Integer

    @jsonName("boot")
    @documentation("The boot order of the virtual machine.")
    boot: String

    @jsonName("bios")
    @documentation("The BIOS type.")
    bios: VirtualMachineBios

    @jsonName("bootdisk")
    @documentation("The boot disk of the virtual machine.")
    bootDisk: String

    @jsonName("cdrom")
    @documentation("The CD-ROM device and its configuration. An alias for option ide2") // probably not include this then...
    cdrom: String

    @jsonName("cicustom")
    @documentation("Specify custom cloud-init files to be used at start.")
    cloudInitCustomFiles: String

    @jsonName("cipassword")
    @documentation("The password for the cloud-init user.")
    cloudInitPassword: String

    @jsonName("citype")
    @documentation("The cloud-init type.")
    cloudInitType: VirtualMachineCloudInitType

    @jsonName("ciuser")
    @documentation("The cloud-init user.")
    cloudInitUser: String

    @jsonName("cores")
    @documentation("Number of cores per socket.")
    cores: Integer

    @jsonName("cpu")
    @documentation("The CPU type.")
    cpu: String

    @jsonName("cpulimit")
    @documentation("CPU usage limit.")
    cpuLimit: Integer

    @jsonName("cpuunits")
    @documentation("CPU weight for a VM. The higher the value, the more CPU time the VM gets.")
    cpuUnits: Integer

    @jsonName("description")
    @documentation("The description of the virtual machine.")
    description: String

    @jsonName("digest")
    @documentation("The SHA1 digest of the virtual machine configuration. This can prevent concurrent modifications of the virtual machine configuration.")
    digest: String

    @jsonName("delete")
    @documentation("A list of settings to delete from the configuration.")
    delete: String

    @jsonName("efidisk0")
    @documentation("The EFI disk device and its configuration.")
    efiDisk: String

    @jsonName("freeze")
    @documentation("Freeze the CPU at virtual machine start.")
    freeze: Boolean

    @jsonName("hookscript")
    @documentation("The hook script that is used at various point in the virtual machines lifecycle.")
    hookScript: String

    @jsonName("hostpci0")
    @documentation("The host PCI device and its configuration.")
    hostPci0: String

    @jsonName("hostpci1")
    @documentation("The host PCI device and its configuration.")
    hostPci1: String

    @jsonName("hostpci2")
    @documentation("The host PCI device and its configuration.")
    hostPci2: String

    @jsonName("hostpci3")
    @documentation("The host PCI device and its configuration.")
    hostPci3: String

    @jsonName("hostpci4")
    @documentation("The host PCI device and its configuration.")
    hostPci4: String

    @jsonName("hostpci5")
    @documentation("The host PCI device and its configuration.")
    hostPci5: String

    @jsonName("hostpci6")
    @documentation("The host PCI device and its configuration.")
    hostPci6: String

    @jsonName("hostpci7")
    @documentation("The host PCI device and its configuration.")
    hostPci7: String

    @jsonName("hostpci8")
    @documentation("The host PCI device and its configuration.")
    hostPci8: String

    @jsonName("hostpci9")
    @documentation("The host PCI device and its configuration.")
    hostPci9: String

    @jsonName("hugepages")
    @documentation("Enable hugepages support. Default to disabled.")
    hugePages: VirtualMachineHugePages

    @jsonName("ide0")
    @documentation("Volume used as IDE or harddisk.")
    ide0: String

    @jsonName("ide1")
    @documentation("Volume used as IDE or harddisk.")
    ide1: String

    @jsonName("ide2")
    @documentation("Volume used as IDE or harddisk.")
    ide2: String

    @jsonName("ide3")
    @documentation("Volume used as IDE or harddisk.")
    ide3: String

    @jsonName("ipconfig0")
    @documentation("The ip address and gateways for the interface. Ip addresses are in CIDR format. Example value: ip=10.0.100.101/24,gw=10.0.100.1")
    ipConfig0: String

    @jsonName("ipconfig1")
    @documentation("The ip address and gateways for the interface. Ip addresses are in CIDR format. Example value: ip=10.0.100.101/24,gw=10.0.100.1")
    ipConfig1: String
    
    @jsonName("ipconfig2")
    @documentation("The ip address and gateways for the interface. Ip addresses are in CIDR format. Example value: ip=10.0.100.101/24,gw=10.0.100.1")
    ipConfig2: String

    @jsonName("ipconfig3")
    @documentation("The ip address and gateways for the interface. Ip addresses are in CIDR format. Example value: ip=10.0.100.101/24,gw=10.0.100.1")
    ipConfig3: String

    @jsonName("ipconfig4")
    @documentation("The ip address and gateways for the interface. Ip addresses are in CIDR format. Example value: ip=10.0.100.101/24,gw=10.0.100.1")
    ipConfig4: String

    @jsonName("ipconfig5")
    @documentation("The ip address and gateways for the interface. Ip addresses are in CIDR format. Example value: ip=10.0.100.101/24,gw=10.0.100.1")
    ipconfig5: String

    @jsonName("ipconfig6")
    @documentation("The ip address and gateways for the interface. Ip addresses are in CIDR format. Example value: ip=10.0.100.101/24,gw=10.0.100.1")
    ipConfig6: String

    @jsonName("ipconfig7")
    @documentation("The ip address and gateways for the interface. Ip addresses are in CIDR format. Example value: ip=10.0.100.101/24,gw=10.0.100.1")
    ipConfig7: String

    @jsonName("ivshmem")
    @documentation("Inter VM-shared memory.")
    interVirtualMachineSharedMemory: String

    @jsonName("keephugepages")
    @documentation("Keep hugepages after shutdown.")
    keepHugePages: BooleanInteger

    @jsonName("keyboard")
    @documentation("The keyboard layout for the virtual machine.")
    vncKeyboard: VirtualMachineKeyboard

    @jsonName("kvm")
    @documentation("Enable KVM support. Default to enabled.")
    kvm: BooleanInteger

    @jsonName("localtime")
    @documentation("Set the real time clock to local time.")
    localTime: BooleanInteger

    @jsonName("lock")
    @documentation("The lock type on the virtual machine.")
    lock: VirtualMachineConfigLock

    @jsonName("machine")
    @documentation("The machine type.")
    machine: String

    @jsonName("memory")
    @documentation("The amount of memory in MB.")
    memory: Integer

    @jsonName("migrate_downtime")
    @documentation("The maximum tolerated downtime in seconds during migration.")
    migrateDowntime: Float

    @jsonName("migrate_speed")
    @documentation("The maximum speed in MB/s during migration. 0 is no limit")
    migrateSpeed: Long

    @jsonName("name")
    @documentation("The name of the virtual machine.")
    name: String

    @jsonName("nameserver")
    @documentation("The nameserver for the virtual machine.")
    nameServer: String

    @jsonName("net0")
    @documentation("The network interface and its configuration.")
    networkDevice0: String

    @jsonName("net1")
    @documentation("The network interface and its configuration.")
    networkDevice1: String

    @jsonName("net2")
    @documentation("The network interface and its configuration.")
    networkDevice2: String

    @jsonName("net3")
    @documentation("The network interface and its configuration.")
    networkDevice3: String

    @jsonName("net4")
    @documentation("The network interface and its configuration.")
    networkDevice4: String

    @jsonName("net5")
    @documentation("The network interface and its configuration.")
    networkDevice5: String

    @jsonName("net6")
    @documentation("The network interface and its configuration.")
    networkDevice6: String

    @jsonName("net7")
    @documentation("The network interface and its configuration.")
    networkDevice7: String

    @jsonName("numa")
    @documentation("Enable NUMA support. Default to disabled.")
    numa: BooleanInteger

    @jsonName("numa0")
    @documentation("NUMA topology.")
    numaTopology0: String

    @jsonName("numa1")
    @documentation("NUMA topology.")
    numaTopology1: String

    @jsonName("numa2")
    @documentation("NUMA topology.")
    numaTopology2: String

    @jsonName("numa3")
    @documentation("NUMA topology.")
    numaTopology3: String

    @jsonName("numa4")
    @documentation("NUMA topology.")
    numaTopology4: String

    @jsonName("numa5")
    @documentation("NUMA topology.")
    numaTopology5: String

    @jsonName("numa6")
    @documentation("NUMA topology.")
    numaTopology6: String

    @jsonName("numa7")
    @documentation("NUMA topology.")
    numaTopology7: String

    @jsonName("onboot")
    @documentation("Start the virtual machine on boot.")
    onBoot: BooleanInteger

    @jsonName("ostype")
    @documentation("The operating system type.")
    osType: VirtualMachineOperatingSystem

    @jsonName("parallel0")
    @documentation("Host parallel device.")
    parallelDevice0: String

    @jsonName("parallel1")
    @documentation("Host parallel device.")
    parallelDevice1: String

    @jsonName("parallel2")
    @documentation("Host parallel device.")
    parallelDevice2: String

    @jsonName("protection")
    @documentation("The protection flag on the virtual machine. Disables remove VM and disk operations.")
    protection: BooleanInteger

    @jsonName("reboot")
    @documentation("Allows reboot. False will have the virtual machine exit on reboot.")
    reboot: BooleanInteger

    @jsonName("rng0")
    @documentation("Virtio based random number generator.")
    randomNumberGenerator: String

    @jsonName("sata0")
    @documentation("Uses the volume as a sata disk.")
    sataDevice0: String

    @jsonName("sata1")
    @documentation("Uses the volume as a sata disk.")
    sataDevice1: String

    @jsonName("sata2")
    @documentation("Uses the volume as a sata disk.")
    sataDevice2: String

    @jsonName("sata3")
    @documentation("Uses the volume as a sata disk.")
    sataDevice3: String

    @jsonName("sata4")
    @documentation("Uses the volume as a sata disk.")
    sataDevice4: String

    @jsonName("sata5")
    @documentation("Uses the volume as a sata disk.")
    sataDevice5: String

    @jsonName("scsi0")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice0: String

    @jsonName("scsi1")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice1: String

    @jsonName("scsi2")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice2: String

    @jsonName("scsi3")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice3: String

    @jsonName("scsi4")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice4: String

    @jsonName("scsi5")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice5: String

    @jsonName("scsi6")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice6: String

    @jsonName("scsi7")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice7: String

    @jsonName("scsi8")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice8: String

    @jsonName("scsi9")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice9: String

    @jsonName("scsi10")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice10: String

    @jsonName("scsi11")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice11: String

    @jsonName("scsi12")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice12: String

    @jsonName("scsi13")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice13: String

    @jsonName("scsi14")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice14: String

    @jsonName("scsi15")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice15: String

    @jsonName("scsi16")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice16: String

    @jsonName("scsi17")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice17: String

    @jsonName("scsi18")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice18: String

    @jsonName("scsi19")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice19: String

    @jsonName("scsi20")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice20: String

    @jsonName("scsi21")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice21: String

    @jsonName("scsi22")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice22: String

    @jsonName("scsi23")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice23: String

    @jsonName("scsi24")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice24: String

    @jsonName("scsi25")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice25: String

    @jsonName("scsi26")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice26: String

    @jsonName("scsi27")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice27: String

    @jsonName("scsi28")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice28: String

    @jsonName("scsi29")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice29: String

    @jsonName("scsi30")
    @documentation("Uses the volume as a scsi disk.")
    scsiDevice30: String

    @jsonName("scsihw")
    @documentation("The SCSI controller type.")
    scsiControllerType: VirtualMachineScsiControllerType

    @jsonName("searchdomain")
    @documentation("Cloudinit search domain.")
    cloudInitSearchDomain: String

    @jsonName("serial0")
    @documentation("A serial device on the virtual machine.")
    serialPort0: String

    @jsonName("serial1")
    @documentation("A serial device on the virtual machine.")
    serialPort1: String

    @jsonName("serial2")
    @documentation("A serial device on the virtual machine.")
    serialPort2: String

    @jsonName("serial3")
    @documentation("A serial device on the virtual machine.")
    serialPort3: String

    @jsonName("shares")
    @documentation("The amount of memory shares for autoballooning.")
    memoryShares: Integer

    @jsonName("smbios1")
    @documentation("SMBIOS type 1 field.")
    smbios1: String

    @jsonName("sockets")
    @documentation("The number of cpu sockets.")
    cpuSockets: Integer

    @jsonName("spice_enhancements")
    @documentation("Enable spice enhancements.")
    spiceEnhancements: String

    @jsonName("sshkeys")
    @documentation("Cloud init SSH public keys. One per line.")
    cloudInitSshKeys: String

    @jsonName("startdate")
    @documentation("The start date for the virtual machine real time clock.")
    realTimeClockStart: String

    @jsonName("startup")
    @documentation("The startup policy for the virtual machine.")
    startupPolicy: String

    @jsonName("tablet")
    @documentation("Enable tablet device.")
    tabletEnabled: BooleanInteger

    @jsonName("tags")
    @documentation("The tags for the virtual machine.")
    tags: String

    @jsonName("template")
    @documentation("If the virtual machine is a template or not.")
    isTemplate: BooleanInteger

    @jsonName("tpmstate0")
    @documentation("Configure a disk for storing TPM state.")
    tpmState0: String

    @jsonName("unused0")
    @documentation("An unused disk on the virtual machine.")
    unusedDisk0: String

    @jsonName("unused1")
    @documentation("An unused disk on the virtual machine.")
    unusedDisk1: String

    @jsonName("unused2")
    @documentation("An unused disk on the virtual machine.")
    unusedDisk2: String

    @jsonName("unused3")
    @documentation("An unused disk on the virtual machine.")
    unusedDisk3: String

    @jsonName("unused4")
    @documentation("An unused disk on the virtual machine.")
    unusedDisk4: String

    @jsonName("unused5")
    @documentation("An unused disk on the virtual machine.")
    unusedDisk5: String

    @jsonName("unused6")
    @documentation("An unused disk on the virtual machine.")
    unusedDisk6: String

    @jsonName("unused7")
    @documentation("An unused disk on the virtual machine.")
    unusedDisk7: String

    @jsonName("usb0")
    @documentation("A usb device on the virtual machine.")
    usbDevice0: String

    @jsonName("usb1")
    @documentation("A usb device on the virtual machine.")
    usbDevice1: String

    @jsonName("usb2")
    @documentation("A usb device on the virtual machine.")
    usbDevice2: String

    @jsonName("usb3")
    @documentation("A usb device on the virtual machine.")
    usbDevice3: String

    @jsonName("usb4")
    @documentation("A usb device on the virtual machine.")
    usbDevice4: String

    @jsonName("usb5")
    @documentation("A usb device on the virtual machine.")
    usbDevice5: String

    @jsonName("usb6")
    @documentation("A usb device on the virtual machine.")
    usbDevice6: String

    @jsonName("usb7")
    @documentation("A usb device on the virtual machine.")
    usbDevice7: String

    @jsonName("usb8")
    @documentation("A usb device on the virtual machine.")
    usbDevice8: String

    @jsonName("usb9")
    @documentation("A usb device on the virtual machine.")
    usbDevice9: String

    @jsonName("usb10")
    @documentation("A usb device on the virtual machine.")
    usbDevice10: String

    @jsonName("usb11")
    @documentation("A usb device on the virtual machine.")
    usbDevice11: String

    @jsonName("usb12")
    @documentation("A usb device on the virtual machine.")
    usbDevice12: String

    @jsonName("usb13")
    @documentation("A usb device on the virtual machine.")
    usbDevice13: String

    @jsonName("usb14")
    @documentation("A usb device on the virtual machine.")
    usbDevice14: String

    @jsonName("hotplug")
    @documentation("Hotplug devices.")
    hotplug: String

    @jsonName("vcpus")
    @documentation("The number of hotplugged virtual cpus.")
    hotpluggedCpus: Integer

    @jsonName("vga")
    @documentation("Configuration for the VGA hardware.")
    vga: String

    @jsonName("virtio0")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice0: String

    @jsonName("virtio1")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice1: String

    @jsonName("virtio2")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice2: String

    @jsonName("virtio3")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice3: String

    @jsonName("virtio4")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice4: String

    @jsonName("virtio5")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice5: String

    @jsonName("virtio6")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice6: String

    @jsonName("virtio7")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice7: String

    @jsonName("virtio8")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice8: String

    @jsonName("virtio9")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice9: String

    @jsonName("virtio10")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice10: String

    @jsonName("virtio11")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice11: String

    @jsonName("virtio12")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice12: String

    @jsonName("virtio13")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice13: String

    @jsonName("virtio14")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice14: String

    @jsonName("virtio15")
    @documentation("Uses the volume as a virtio disk.")
    virtioDevice15: String

    @jsonName("vmgenid")
    @documentation("Enable VM generation id seed.")
    vmGenerationId: String

    @jsonName("vmstatestorage")
    @documentation("Default location for storing VM state.")
    vmStateStorage: String

    @jsonName("watchdog")
    @documentation("The watchdog device for the virtual machine.")
    watchdog: String
}

@output
structure ApplyVirtualMachineConfigurationAsyncOutput {
    @required
    @jsonName("data")
    result: String
}