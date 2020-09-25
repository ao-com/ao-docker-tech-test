terraform {
  backend "s3" {
    bucket = "test-terraform-state"
    key    = "test"

    # Hosting 
    region         = "eu-west-2"
    dynamodb_table = "test-terraform-state-locks"
    encrypt        = true
  }
}
