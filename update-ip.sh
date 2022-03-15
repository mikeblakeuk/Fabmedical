
#!/bin/bash

# Public IP address
IP="13.83.45.116"

# Resource Group that contains AKS Node Pool fabmedical-562487-dns-36f3bee6.hcp.westus.azmk8s.io
KUBERNETES_NODE_RG="MC_fabmedical-562487_fabmedical-562487_westus"

# Name to associate with public IP address
DNSNAME="fabmedical-562487-ingress"

# Get the resource-id of the public ip
PUBLICIPID=$(az network public-ip list --resource-group $KUBERNETES_NODE_RG --query "[?ipAddress!=null]|[?contains(ipAddress, '$IP')].[id]" --output tsv)

# Update public ip address with dns name
az network public-ip update --ids $PUBLICIPID --dns-name $DNSNAME