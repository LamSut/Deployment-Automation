//just for practice

variables {
  bucket         = "b2111933-bucket"
  dynamodb_table = "b2111933-table"
  //more
}

run "bucket_tests" {
  command = plan
  assert {
    condition     = var.bucket == "b2111933-bucket"
    error_message = "Not our bucket!"
  }
}

run "dynamodb_table_tests" {
  command = plan
  assert {
    condition     = var.dynamodb_table == "b2111933-table"
    error_message = "Not our table!"
  }
}

