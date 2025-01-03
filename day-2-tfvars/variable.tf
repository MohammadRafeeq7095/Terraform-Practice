variable "amiid" {
  description = "Inserting ami value to main.tf"
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

variable "subnet_id" {
  type = string
  default = ""
}