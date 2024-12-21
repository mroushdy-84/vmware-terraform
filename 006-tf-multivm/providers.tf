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
