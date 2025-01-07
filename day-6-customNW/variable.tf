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

variable "vpc-cidr_block" {
  type = string
  default = ""
}

variable "subnet-cidr" {
  type = string
  default = ""
}


