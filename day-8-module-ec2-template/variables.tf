variable "ami_id" {
  description = "inserting ami value to main.tf"
  type = string
  default = ""
}

variable "type" {
  type = string
  default = ""
}

variable "keyname" {
  type = string
  default = ""
}

variable "subnet" {
  type = string
  default = ""
}