terraform {
  backend "s3" {
    bucket = "default-cicd-terraform-state"
    key    = "test"

    # Hosting in Frankfurt
    region         = "eu-central-1"
    dynamodb_table = "default-cicd-terraform-state-locks"
    encrypt        = true
  }
}
