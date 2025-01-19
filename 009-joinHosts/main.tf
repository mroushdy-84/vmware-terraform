resource "vsphere_host" "esxi-hosts" {
  for_each   = toset(var.tf-esxi-hosts) 
  hostname   = each.value
  username   = "root"
  password   = "P@ssw0rd"
  license    = "00000-00000-00000-00000-00000"
  thumbprint = data.vsphere_host_thumbprint.thumbprint[each.key].id
  cluster    = data.vsphere_compute_cluster.cluster.id
  services {
    ntpd {
      enabled     = true
      policy      = "on"
      ntp_servers = ["pool.ntp.org"]
    }
 }
}