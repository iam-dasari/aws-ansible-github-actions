# resource "aws_security_group" "web" {

#     name = "web-sg"

#     ingress {
#         from_port   = 22
#         to_port     = 22
#         protocol    = "tcp"
#         cidr_blocks = ["10.0.0.0/8"] # Restrict to VPN/Bastion
#     }

#     ingress {
#         from_port   = 80
#         to_port     = 80
#         protocol    = "tcp"
#         cidr_blocks = ["0.0.0.0/0"]
#     }

#     egress {
#         from_port   = 0
#         to_port     = 0
#         protocol    = "-1"
#         cidr_blocks = ["0.0.0.0/0"]
#     }
# }


resource "aws_instance" "web" {

    count = var.instance_count

    ami           = "ami-0521cb2d60cfbb1a6" # Amazon Linux 2023
    instance_type = var.instance_type

    key_name = var.key_name

    # vpc_security_group_ids = [
    #     aws_security_group.web.id
    # ]

    tags = {
        Name        = "web-${count.index}"
        Environment = "prod"
        Role        = "web"
        ManagedBy   = "terraform"
    }
}