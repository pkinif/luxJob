test_that("log_search returns a logical when successful", {
  result <- log_search(user_id = 1, query = "test search query")
  expect_true(is.logical(result))
})

test_that("log_search returns TRUE or FALSE when successful", {
  result <- log_search(user_id = 1, query = "test search query")
  expect_true(result %in% c(TRUE, FALSE))
})

test_that("log_search returns FALSE if user_id is missing", {
  result_invalid <- log_search(user_id = NA, query = "invalid")
  expect_false(result_invalid)
})

test_that("log_search returns FALSE if query is empty", {
  result_empty <- log_search(user_id = 1, query = "")
  expect_false(result_empty)
})
