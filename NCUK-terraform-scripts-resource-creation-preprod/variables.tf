variable "NCUK-vpc-cidr-block-preprod" {
	type = string
	description = "To set cidr for vpc"
}
variable "NCUK-subnet-cidr-block-preprod" {
	type = string
	description = "To set cidr for subnet"
}
variable "NCUK-availability-zone-preprod" {
	type = string
	description = "To set AWS availability region"
}
variable "NCUK-env-prefix-preprod" {
	type = string
	description = "Set as dev or prod or qa etc. based on desired environment"
}
variable "NCUK-instance-type-preprod" {
	type = string
	description = "To desired instance type for AWS EC2 instance"
}
