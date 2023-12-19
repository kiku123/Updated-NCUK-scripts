variable "NCUK-vpc-cidr-block-preprod" {
	type = string
}

variable "private_NCUK-subnet-cidr-block-preprods" {
	type = list(string)
}
variable "public_NCUK-subnet-cidr-block-preprods" {
	type = list(string)
}
