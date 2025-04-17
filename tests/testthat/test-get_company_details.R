test_that("get_company_details returns a list", {
  result <- get_company_details(1)
  expect_true(is.list(result))
})

test_that("get_company_details returns a named list with 'company' and 'vacancies'", {
  result <- get_company_details(1)
  expect_named(result, c("company", "vacancies"))
})

test_that("get_company_details$company is a data frame", {
  result <- get_company_details(1)
  expect_s3_class(result$company, "data.frame")
})

test_that("get_company_details$vacancies is a data frame", {
  result <- get_company_details(1)
  expect_s3_class(result$vacancies, "data.frame")
})

test_that("get_company_details$company has exactly one row", {
  result <- get_company_details(1)
  expect_equal(nrow(result$company), 1)
})

test_that("get_company_details$company has expected columns", {
  result <- get_company_details(1)
  expected_cols <- c("company_id", "name", "sector")
  expect_true(all(expected_cols %in% names(result$company)))
})
