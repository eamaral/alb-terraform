variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "ID da VPC onde o ALB será criado"
  type        = string
  default     = ""
}

variable "private_subnets" {
  description = "Subnets privadas associadas ao ALB"
  type        = list(string)
  default     = []
}

variable "public_subnets" {
  description = "Subnets públicas para o ALB"
  type        = list(string)
  default     = []
}
