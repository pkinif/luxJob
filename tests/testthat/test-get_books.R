# # Test without skill filter
# test_that("get_books returns a data frame without filter", {
#   books <- get_books()
#   expect_s3_class(books, "data.frame")
# })
# 
# test_that("get_books returns expected columns without filter", {
#   books <- get_books()
#   expected_cols <- c("book_id", "title", "author", "skill_id")
#   expect_true(all(expected_cols %in% names(books)))
# })
# 
# # Test with skill filter
# test_that("get_books returns a data frame with skill filter", {
#   skill_uri <- "http://data.europa.eu/esco/skill/70198e4e-86ad-4acc-a9eb-e24e2c107d18"
#   filtered <- get_books(skill = skill_uri)
#   expect_s3_class(filtered, "data.frame")
# })
# 
# test_that("get_books returns expected columns with skill filter", {
#   skill_uri <- "http://data.europa.eu/esco/skill/70198e4e-86ad-4acc-a9eb-e24e2c107d18"
#   filtered <- get_books(skill = skill_uri)
#   expected_cols <- c("book_id", "title", "author", "skill_id")
#   expect_true(all(expected_cols %in% names(filtered)))
# })
