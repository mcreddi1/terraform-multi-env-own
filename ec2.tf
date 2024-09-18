
 resource "aws_instance" "terraform" {
     for_each = var.instances_names #this variable is a map
     ami = "ami-09c813fb71547fc4f"
     instance_type = each.value
     vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
     tags = merge(
         var.common_tags,
         var.tags,
         {
             Name = each.key
         }
     )
 }

 resource "aws_security_group" "allow_ssh_terraform" {
     name        = "allow_sshh-${var.environment}" #allow_ssh is already there in my account
     description = "Allow port number 22 for SSH access"
     # usually we allow everything in egress
     egress {
         from_port        = 0
         to_port          = 0
         protocol         = "-1"
         cidr_blocks      = ["0.0.0.0/0"]
         ipv6_cidr_blocks = ["::/0"]
     }
     ingress {
         from_port        = 22
         to_port          = 22
         protocol         = "tcp"
         cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
         ipv6_cidr_blocks = ["::/0"]
     }
     tags = {
         Name = "allow_sshh-${var.environment}"
     }
 }

#here i'm creating every instance with specific details

 # # EC2 Instances
# resource "aws_instance" "mysql_instance" { 
#   ami           = var.ami_id  # Example AMI, replace with your desired AMI
#   instance_type = "t2.micro"
#   tags = {
#     Name        = "mysql-${var.environment}"
#     Environment = var.environment
#   }
# }

# resource "aws_instance" "frontend_instance" {
#   ami           = var.ami_id  # Example AMI, replace with your desired AMI
#   instance_type = "t2.micro"
#   tags = {
#     Name        = "frontend-${var.environment}"
#     Environment = var.environment
#   }
# }

# resource "aws_instance" "backend_instance" {
#   ami           = var.ami_id  # Example AMI, replace with your desired AMI
#   instance_type = "t2.micro"
#   tags = {
#     Name        = "backend-${var.environment}"
#     Environment = var.environment
#   }
#}
