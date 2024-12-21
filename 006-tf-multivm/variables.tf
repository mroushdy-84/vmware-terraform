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

variable "multi_vm_name" {
  type = list(string)
  default = [ "tf-course-vm01",
              "tf-course-vm02",
              
  ]
}