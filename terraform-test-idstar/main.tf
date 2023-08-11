# create EC2 instance
resource "aws_instance" "terraform-idstar-devops" {
  ami           = "ami-0df7a207adb9748c7"
  instance_type = "c4.xlarge"
  key_name      = "terraform-instance"
  associate_public_ip_address = true
  user_data = "IyEvYmluL2Jhc2gKCiMgVXBkYXRlIHBhY2thZ2UgcmVwb3NpdG9yaWVzCnN1ZG8gYXB0IHVwZGF0ZSAteQoKIyBJbnN0YWxsIERvY2tlciB1c2luZyBTbmFwCnN1ZG8gc25hcCBpbnN0YWxsIGRvY2tlcgoKIyBTZXQgdXAgRG9ja2VyIENvbXBvc2UgYXMgYSBDTEkgcGx1Z2luCkRPQ0tFUl9DT05GSUc9JHtET0NLRVJfQ09ORklHOi0kSE9NRS8uZG9ja2VyfQpta2RpciAtcCAkRE9DS0VSX0NPTkZJRy9jbGktcGx1Z2lucwpjdXJsIC1TTCBodHRwczovL2dpdGh1Yi5jb20vZG9ja2VyL2NvbXBvc2UvcmVsZWFzZXMvZG93bmxvYWQvdjIuMjAuMi9kb2NrZXItY29tcG9zZS1saW51eC14ODZfNjQgLW8gJERPQ0tFUl9DT05GSUcvY2xpLXBsdWdpbnMvZG9ja2VyLWNvbXBvc2UKCiMgU3dpdGNoIHRvIHRoZSAndWJ1bnR1JyB1c2VyIGFuZCBleGVjdXRlIHRoZSBmb2xsb3dpbmcgY29tbWFuZHMKc3UgLSB1YnVudHUgLWMgJwogICAgIyBDcmVhdGUgYSBuZXcgZ3JvdXAgbmFtZWQgJ2RvY2tlcicKICAgIHN1ZG8gZ3JvdXBhZGQgZG9ja2VyCgogICAgIyBBZGQgdGhlIGN1cnJlbnQgdXNlciB0byB0aGUgJ2RvY2tlcicgZ3JvdXAKICAgIHN1ZG8gdXNlcm1vZCAtYUcgZG9ja2VyICRVU0VSCgogICAgIyBDbG9uZSB0aGUgR2l0IHJlcG9zaXRvcnkKICAgIGdpdCBjbG9uZSBodHRwczovL2dpdGh1Yi5jb20vYXdzLWNvbnRhaW5lcnMvcmV0YWlsLXN0b3JlLXNhbXBsZS1hcHAuZ2l0CgogICAgIyBOYXZpZ2F0ZSB0byB0aGUgYXBwbGljYXRpb24gZGlyZWN0b3J5CiAgICBjZCByZXRhaWwtc3RvcmUtc2FtcGxlLWFwcC9kaXN0L2RvY2tlci1jb21wb3NlCgogICAgIyBTdGFydCB0aGUgYXBwbGljYXRpb24gdXNpbmcgRG9ja2VyIENvbXBvc2UKICAgIHN1ZG8gTVlTUUxfUEFTU1dPUkQ9InJvb3QiIGRvY2tlciBjb21wb3NlIHVwCicK"

  vpc_security_group_ids = [aws_security_group.launch-wizard-14.id]  # Associate the instance with the security group

  tags = {
    Name = "terraform-idstar-devops"
  }
}

# ingress rules
resource "aws_security_group" "launch-wizard-14" {
  name        = "launch-wizard-14"
  description = "launch-wizard-14 created 2023-08-10T16:34:59.949Z"
  vpc_id      = "vpc-ba60b1dc"
}

resource "aws_security_group_rule" "sg_rule_ssh" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.launch-wizard-14.id
}

resource "aws_security_group_rule" "sg_rule_http" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.launch-wizard-14.id
}

resource "aws_security_group_rule" "sg_rule_https" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.launch-wizard-14.id
}

resource "aws_security_group_rule" "sg_rule_allow_8888" {
  type        = "ingress"
  from_port   = 8888
  to_port     = 8888
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  description = "allow connection to port 8888"
  security_group_id = aws_security_group.launch-wizard-14.id
}

# egress rule
resource "aws_security_group_rule" "outbound_rule" {
  type        = "egress"
  from_port   = 0            
  to_port     = 65535        
  protocol    = "-1"        
  cidr_blocks = ["0.0.0.0/0"]
  
  security_group_id = aws_security_group.launch-wizard-14.id
}

