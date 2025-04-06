test_that("get_book_by_id returns a single book or empty data frame", {
  # Replace with a known book_id
  known_id <- 100
  
  result <- get_book_by_id(known_id)
  
  expect_true(is.data.frame(result))
  
  if (nrow(result) > 0) {
    expect_equal(nrow(result), 1)
    expect_true(all(c("book_id", "title", "author", "skill_id") %in% names(result)))
    expect_equal(result$book_id, known_id)
  }
})
