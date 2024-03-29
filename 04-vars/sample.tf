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
  value = var.color
}

output "colorcode" {
  value = var.colorcode
}

output "bool" {
  value = var.bool
}

# Variable Types
//list
variable "COLORS" {
  default = ["RED", "GREEN", "YELLOW", 40, false]
}
// A list supports different data types.

//Map
variable "COLORMAPS" {
  default = {
    RED = 31
    GREEN = 32
    YELLOW = 33
  }
}

output "COLOR_FROM_LIST" {
  value = var.COLORS[2]
}

output "COLOR_FROM_MAP" {
  value = var.COLORMAPS["RED"]
}

// Access variables from shell environment variables
// export TF_VAR_FRUIT_NAME=Apple  or
// terraform apply -auto=-approve -var FRUIT_NAME=Banana  or
// terraform apply -auto=-approve -var-file=vars.tfvars
variable "FRUIT_NAME" {}

output "FRUIT_NAME" {
  value = var.FRUIT_NAME
}

// When we prompt an input from user, and if he gives a wrong input then a validation should happen.
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}