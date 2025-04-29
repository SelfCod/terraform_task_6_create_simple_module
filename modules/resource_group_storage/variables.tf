variable "prefix" {
  default     = "example"
  type        = string
  description = "Prefix for resources name"
  validation {
    condition     = length(var.prefix) < 16
    error_message = "The suffix can't be longer than 16 characters"
  }
}
variable "location" {
  default     = "East US"
  type        = string
  description = "The location for all resources"
}

variable "subscription_id" {
  type        = string
  description = "Ідентифікатор підписки Azure"
}