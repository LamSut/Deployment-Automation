//just for practice

variables {
  bucket         = "b2111933-bucket"
  dynamodb_table = "b2111933-table"
  //more
}

run "backend_tests" {
  command = plan

  assert {
    condition     = var.bucket == "b2111933-bucket"
    error_message = "Not our bucket!"
  }

  assert {
    condition     = var.dynamodb_table == "b2111933-table"
    error_message = "Not our table!"
  }
}
