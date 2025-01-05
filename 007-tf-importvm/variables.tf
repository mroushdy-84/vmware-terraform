variable "admin_password" {
    type = string
    default = "P@ssw0rd"
}

variable "vm_name" {
    type = string
    default = "tf-course-vm02"
}

variable "vm_hostname" {
   type = string
  default = "tf-course-vm02"
}

variable "cpu" {
    type = number
    default = 4  
}

variable "ram" {
    type = number
    default = 3072
  
}