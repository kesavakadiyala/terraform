#DATA TYPES
variable "color" {
  description = "Declaring String Variable"
  default = "Red"
}

variable "colorcode" {
  description = "Declaring Number Variable can be float(1.11)"
  default = 31
}

variable "bool" {
  description = "Declaring Boolean Variable"
  default = true
}

//Accessing Variables
output "color" {
  description = "Accessing String Variable"
  value = var.color
}

output "colorcode" {
  description = "Accessing Number Variable"
  value = var.colorcode
}

output "bool" {
  description = "Accessing Booloean Variable"
  value = var.bool
}