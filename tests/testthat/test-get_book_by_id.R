test_that("get_book_by_id returns a data frame", {
  result <- get_book_by_id(100)
  expect_true(is.data.frame(result))
})

test_that("get_book_by_id returns exactly one row", {
  result <- get_book_by_id(100)
  expect_equal(nrow(result), 1)
})

test_that("get_book_by_id returns the expected columns", {
  result <- get_book_by_id(100)
  expected_cols <- c("book_id", "title", "author", "skill_id")
  expect_true(all(expected_cols %in% names(result)))
})

test_that("get_book_by_id returns the correct book_id", {
  known_id <- 100
  result <- get_book_by_id(known_id)
  expect_equal(result$book_id, known_id)
})
