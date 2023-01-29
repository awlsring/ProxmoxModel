default: install

install:
	gradle build
	openapi-generator generate -i ./build/smithyprojections/ProxmoxModel/open-api/openapi/Proxmox.openapi.json -g go -o ./build/output/ProxmoxGo --git-user-id awlsring --git-repo-id proxmox-go --additional-properties enumClassPrefix=true