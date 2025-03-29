provider "aws" {
  region = "us-east-1"
}

# Variáveis
variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}

# Security Group para o ALB
resource "aws_security_group" "alb_sg" {
  name        = "fastfood-alb-sg"
  description = "Security group for internal ALB"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Target Group
resource "aws_lb_target_group" "backend_tg" {
  name        = "fastfood-tg"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    path                = "/health"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Application Load Balancer (interno)
resource "aws_lb" "fastfood_alb" {
  name               = "fastfood-alb"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sg.id]
  subnets            = var.private_subnets
}

# Listener
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.fastfood_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.backend_tg.arn
  }
}

# Variáveis
variable "vpc_id" {}
variable "private_subnets" {
  type = list(string)
}

# Outputs
output "alb_dns_name" {
  value = aws_lb.fastfood_alb.dns_name
}

output "alb_target_group_arn" {
  value = aws_lb_target_group.backend_tg.arn
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}