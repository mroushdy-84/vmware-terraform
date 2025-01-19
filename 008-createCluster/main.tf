resource "vsphere_compute_cluster" "compute_cluster" {
  name            = var.tf_cluster_name
  datacenter_id   = data.vsphere_datacenter.datacenter.id
  
  drs_enabled          = false
  // drs_automation_level = "fullyAutomated"

  ha_enabled = false
}