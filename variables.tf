variable "region" {
  description = "Região da AWS"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o ALB será criado"
  type        = string
}

variable "private_subnets" {
  description = "Subnets privadas associadas ao ALB"
  type        = list(string)
}