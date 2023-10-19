#!/bin/bash


# Login to IBM Cloud using SSO
#sso_token = kdaj;lkjfa
ibmcloud login -sso 
# List PI services
ibmcloud pi service-list

# Set service target
read -p "Enter the CRN of the PI service: " pi_service_crn
ibmcloud pi service-target $pi_service_crn

# List storage pools
ibmcloud pi storage-pools

read -p "Enter the name of the VM: " vm_name
read -p "Enter the image number(): " image_number
read -p "Enter the number of GB of memory: " memory_gb
read -p "Enter the network name: " network_name
read -p "Enter the number of processors: " num_processors
read -p "Enter processor type (shared/dedicated): " processor_type
read -p "Enter system type (s922/e980): " sys_type
read -p "Enter the name of the key: " key_name
read -p "Enter the storage pool (e.g., Tier3-Flash-1): " storage_pool
# Create an instance
ibmcloud pi instance-create $vm_name \
  --image $image_number \
  --memory $memory_gb \
  --network "$network_name" \
  --processors $num_processors \
  --processor-type $processor_type \
  --sys-type $sys_type \
  --key-name "$key_name" \
  --storage-pool $storage_pool

