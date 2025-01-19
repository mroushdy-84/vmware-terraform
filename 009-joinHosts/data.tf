data "vsphere_datacenter" "datacenter" {
  name = "Datacenter"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "tf-cluster04"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_host_thumbprint" "thumbprint" {
  for_each   = toset(var.tf-esxi-hosts)
  address  = each.value
  insecure = true
}
