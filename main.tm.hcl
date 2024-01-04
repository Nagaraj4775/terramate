generate_hcl "_main.tf" {
  content {
module "website_s3_bucket" {
  source = "../modules/aws-s3-static-website-bucket"

  bucket_name = "${global.bucket_name}"

  tags = {
    Terraform   = "true"
    Environment = "${global.env}"
  }
}

module "security_group" {
  source	      = "../modules/aws-security-groups"
  sg_name    	      = "terramate-sg-${global.env}"
  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["http-80-tcp"]
}

}
}
