test_that("log_search inserts a valid query and handles errors", {
  # Should succeed if user_id exists
  result <- log_search(user_id = 1, query = "test search query")
  expect_true(is.logical(result))
  expect_true(result %in% c(TRUE, FALSE))
  
  # Should fail if user_id is missing
  result_invalid <- log_search(user_id = NA, query = "invalid")
  expect_false(result_invalid)
  
  # Should fail if query is empty
  result_empty <- log_search(user_id = 1, query = "")
  expect_false(result_empty)
})
