terraform {
  backend "s3" {
    bucket         = "b2111933-bucket"
    key            = "state"
    region         = var.default_region
    dynamodb_table = "b2111933-table"
  }
}
