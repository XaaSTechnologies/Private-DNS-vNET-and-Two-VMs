{\rtf1\ansi\ansicpg1252\cocoartf2513
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\paperw11900\paperh16840\margl1440\margr1440\vieww16140\viewh13460\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural\partightenfactor0

\f0\fs36 \cf0 az group create --name RG-13-Private-DNS --location westeurope\
\
az network vnet create \\\
  --name Private-DNS-vNET \\\
  --resource-group RG-13-Private-DNS \\\
  --location westeurope \\\
  --address-prefix 10.15.0.0/16 \\\
  --subnet-name Subnet-01 \\\
  --subnet-prefix 10.15.0.0/24\
\
az network nsg create \\\
  --resource-group RG-13-Private-DNS \\\
  --name NSG-VM-01\
\
az network nsg rule create \\\
  --resource-group RG-13-Private-DNS \\\
  --name NSG-VM-01-ALLOW-SSH \\\
  --nsg-name NSG-VM-01 \\\
  --protocol tcp \\\
  --direction inbound \\\
  --source-address-prefix '*' \\\
  --source-port-range '*' \\\
  --destination-address-prefix 'VirtualNetwork' \\\
  --destination-port-range 22 \\\
  --access allow \\\
  --priority 100\
\
az network nsg rule create \\\
  --resource-group RG-13-Private-DNS \\\
  --name NSG-VM-01-ALLOW-ICMP \\\
  --nsg-name NSG-VM-01 \\\
  --protocol icmp \\\
  --direction inbound \\\
  --source-address-prefix '*' \\\
  --source-port-range '*' \\\
  --destination-address-prefix 'VirtualNetwork' \\\
  --destination-port-range '*' \\\
  --access allow \\\
  --priority 200\
\
az vm create \\\
  --resource-group RG-13-Private-DNS \\\
  --name VM-01 \\\
  --admin-username adminuser \\\
  --admin-password adminadmin123! \\\
  --image UbuntuLTS \\\
  --vnet-name Private-DNS-vNET \\\
  --nsg NSG-VM-01 \\\
  --subnet Subnet-01\
\
az network nsg create \\\
  --resource-group RG-13-Private-DNS \\\
  --name NSG-VM-02\
\
az network nsg rule create \\\
  --resource-group RG-13-Private-DNS \\\
  --name NSG-VM-02-ALLOW-SSH \\\
  --nsg-name NSG-VM-02 \\\
  --protocol tcp \\\
  --direction inbound \\\
  --source-address-prefix '*' \\\
  --source-port-range '*' \\\
  --destination-address-prefix 'VirtualNetwork' \\\
  --destination-port-range 22 \\\
  --access allow \\\
  --priority 100\
\
az network nsg rule create \\\
  --resource-group RG-13-Private-DNS \\\
  --name NSG-VM-02-ALLOW-ICMP \\\
  --nsg-name NSG-VM-02 \\\
  --protocol icmp \\\
  --direction inbound \\\
  --source-address-prefix '*' \\\
  --source-port-range '*' \\\
  --destination-address-prefix 'VirtualNetwork' \\\
  --destination-port-range '*' \\\
  --access allow \\\
  --priority 200\
\
az vm create \\\
  --resource-group RG-13-Private-DNS \\\
  --name VM-02 \\\
  --admin-username adminuser \\\
  --admin-password adminadmin123! \\\
  --image UbuntuLTS \\\
  --vnet-name Private-DNS-vNET \\\
  --nsg NSG-VM-02 \\\
  --subnet Subnet-01\
\
}