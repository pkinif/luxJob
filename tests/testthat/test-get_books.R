test_that("get_books returns a list of books optionally filtered by skill", {
  # No filter
  books <- get_books()
  expect_s3_class(books, "data.frame")
  expect_true(all(c("book_id", "title", "author", "skill_id") %in% names(books)))
  
  # With skill filter (replace with known skill_id if needed)
  filtered <- get_books(skill = "skill_r")
  expect_s3_class(filtered, "data.frame")
  expect_true(all(c("book_id", "title", "author", "skill_id") %in% names(filtered)))
})
