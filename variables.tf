variable "environment" {
  description = "Environment name (dev or prod)"
  type        = string
}


variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

variable "instances_names" {
  type = map(string)
}

variable "common_tags" {
  default = {
    project = "expense"
    terraform = "true"
  }

}

variable "tags" {
  type = map
}

variable "zone_id" {
  default = "Z01788187UO8CHWV5NIO"
}

variable "domain_name" {
  default = "devops81s.shop"
}
