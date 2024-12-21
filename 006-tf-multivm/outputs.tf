output "VM_IP" {
  value = [ for i, ipadr in vsphere_virtual_machine.tf-course-vm : ipadr.guest_ip_addresses]
}