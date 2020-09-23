#create S3 bucket backend to store the state file remotely
terraform {
 backend "s3" {
   bucket         = "terraform-statefile"
   key            = "./terraform.tfstate"
   region         = "${var.aws_region}"
   encrypt        = true
   dynamodb_table = "terraform-lock"
 }
}
