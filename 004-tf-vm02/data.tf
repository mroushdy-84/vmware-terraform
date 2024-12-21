data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_datastore" "datastore1" {
  name          = "tf-ds02"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = "tf-cluster3"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "vlan" {
  name          = "vm-vlan101"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "centos9-base" {
  name          = "centos9-temp2"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
