# test_that("get_companies returns a data frame", {
#   companies <- get_companies(limit = 10)
#   expect_s3_class(companies, "data.frame")
# })
# 
# test_that("get_companies returns expected columns", {
#   companies <- get_companies(limit = 10)
#   expected_cols <- c("company_id", "name", "sector")
#   expect_true(all(expected_cols %in% names(companies)))
# })
# 
# test_that("get_companies respects the limit parameter", {
#   companies <- get_companies(limit = 10)
#   expect_lte(nrow(companies), 10)
# })
