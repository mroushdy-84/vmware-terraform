terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.10.0"
    }
  }
}

provider "vsphere" {
  user                 = "administrator@vsphere.local"
  password             = "P@ssw0rd"
  vsphere_server       = "vmw-vc02.aitn.local"
  allow_unverified_ssl = true
  api_timeout          = 10
}

data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_datastore" "NVME01" {
  name          = "NVME01"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host" "host" {
  name          = "esxi7-dl380.aitn.local"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "VLAN103" {
  name          = "VLAN103"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "centos9-base" {
  name          = "centos9-base"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_virtual_machine" "tf-course-vm1" {
  name             = "tf-course-vm1"
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  datastore_id     = data.vsphere_datastore.NVME01.id
  num_cpus         = 2
  memory           = 1024
  firmware         = data.vsphere_virtual_machine.centos9-base.firmware   
  guest_id         = data.vsphere_virtual_machine.centos9-base.guest_id
  scsi_type        = data.vsphere_virtual_machine.centos9-base.scsi_type
  network_interface {
    network_id   = data.vsphere_network.VLAN103.id
    
  }
  disk {
    label            = "Hard Disk 1"
    size             = data.vsphere_virtual_machine.centos9-base.disks.0.size
    thin_provisioned = data.vsphere_virtual_machine.centos9-base.disks.0.thin_provisioned
  }
  clone {
    template_uuid = data.vsphere_virtual_machine.centos9-base.id
    customize {
      network_interface {}
      linux_options {
        host_name = "tf-course-vm1"
        domain    = "aitn.local"
      }
   }
 }
}


