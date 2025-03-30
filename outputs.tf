output "alb_dns_name" {
  description = "DNS do Load Balancer"
  value       = aws_lb.fastfood_alb.dns_name
}

output "alb_target_group_arn" {
  description = "ARN do Target Group"
  value       = aws_lb_target_group.backend_tg.arn
}

output "alb_sg_id" {
  description = "Security Group ID do ALB"
  value       = aws_security_group.alb_sg.id
}

output "alb_listener_arn" {
  description = "ARN do Listener do ALB"
  value       = aws_lb_listener.http.arn
}

output "alb_dns" {
  value = aws_lb.fastfood_alb.dns_name
}