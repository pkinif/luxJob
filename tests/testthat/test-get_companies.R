test_that("get_companies returns a data frame with company info", {
  companies <- get_companies(limit = 10)
  
  expect_s3_class(companies, "data.frame")
  expect_true(all(c("company_id", "name", "sector") %in% names(companies)))
  expect_lte(nrow(companies), 10)
})
