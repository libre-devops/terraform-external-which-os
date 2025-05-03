output "os" {
  description = "The OS that is running the commands"
  value       = local.os
}

output "is_windows" {
  description = "True if the OS is Windows"
  value = local.is_windows
}

output "is_linux" {
  description = "True if the OS is Linux"
  value = local.is_linux
}