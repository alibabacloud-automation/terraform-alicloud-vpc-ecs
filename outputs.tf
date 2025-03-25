output "this_ecs_id" {
  description = "The ID of the ecs."
  value       = alicloud_instance.default.id
}

output "this_vpc_id" {
  description = "The ID of the vpc."
  value       = alicloud_vpc.default.id
}

output "this_ecs_name" {
  description = "The name of the ecs."
  value       = alicloud_instance.default.instance_name
}
