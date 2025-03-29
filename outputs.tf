output "alb_dns_name" {
  description = "DNS do ALB"
  value       = aws_lb.fastfood_alb.dns_name
}

output "alb_target_group_arn" {
  description = "ARN do Target Group do ALB"
  value       = aws_lb_target_group.backend_tg.arn
}

output "alb_sg_id" {
  description = "ID do Security Group do ALB"
  value       = aws_security_group.alb_sg.id
}