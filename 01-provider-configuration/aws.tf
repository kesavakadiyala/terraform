#Default provider configuration
#Without alias is defult configuration
provider "aws" {
  region = "us-east-2"
}

# Additional provider configuration for west coast region;
provider "aws" {
  region = "us-west-2"
  alias = "west"
}

#Default region instance creation using resource
resource "aws_instance" "east" {
  ami = "ami-0e29f13709b106582"
  instance_type = "t2.micro"
}

#west region instance creation using provider
resource "aws_instance" "west" {
  ami = "ami-0e29f13709b106582"
  instance_type = "t2.micro"
  provider = aws.west
}