variable "admin_password" {
    type = string
    default = "P@ssw0rd"
}

variable "tf_cluster_name" {
    type = string
    default = "tf-cluster04" 
}

variable "tf-esxi-hosts" {
    type = list(string)
    default = [ "tf-esxi01.aitn.local",
                "tf-esxi02.aitn.local",
                "tf-esxi03.aitn.local",
    ]
}