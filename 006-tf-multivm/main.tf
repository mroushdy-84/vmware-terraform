resource "vsphere_virtual_machine" "tf-course-vm" {
  for_each         = toset(var.multi_vm_name) 
  name             = each.value
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore1.id
  num_cpus         = var.cpu
  memory           = var.ram
  memory_hot_add_enabled = true
  firmware         = data.vsphere_virtual_machine.centos9-base.firmware   
  guest_id         = data.vsphere_virtual_machine.centos9-base.guest_id
  scsi_type        = data.vsphere_virtual_machine.centos9-base.scsi_type
  network_interface {
    network_id   = data.vsphere_network.vlan.id
    
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
        host_name = each.value
        domain    = "aitn.local"
      }
   }
 }
}


