test_that("get_books returns a list of books optionally filtered by skill", {
  # No filter
  books <- get_books()
  expect_s3_class(books, "data.frame")
  expect_true(all(c("book_id", "title", "author", "skill_id") %in% names(books)))
  
  # With skill filter
  filtered <- get_books(skill = "http://data.europa.eu/esco/skill/70198e4e-86ad-4acc-a9eb-e24e2c107d18")
  expect_s3_class(filtered, "data.frame")
  expect_true(all(c("book_id", "title", "author", "skill_id") %in% names(filtered)))
})
