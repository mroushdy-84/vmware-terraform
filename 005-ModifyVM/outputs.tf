output "VM_IP" {
  value = vsphere_virtual_machine.tf-course-vm2.guest_ip_addresses
}