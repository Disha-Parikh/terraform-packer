provider "aws" {
region = "ap-south-1"
}

locals {
  common_tags = {
    Name = "${var.tag_name}"
  }
}
