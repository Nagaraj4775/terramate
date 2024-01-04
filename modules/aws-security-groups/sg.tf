data "aws_vpc" "default" {
  default = true
}

module "security_group" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.sg_name}"
  description = "Security group for ${var.sg_name}"
  vpc_id      = "${data.aws_vpc.default.id}"

  ingress_cidr_blocks = "${var.ingress_cidr_blocks}"
  ingress_rules       = "${var.ingress_rules}"
  egress_rules        = ["all-all"]
}
