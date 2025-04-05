test_that("get_company_details returns company and vacancies or NULL", {
  # Replace with a real company_id from your DB if available
  known_id <- 1
  
  result <- get_company_details(known_id)
  
  expect_true(is.list(result) || is.null(result))
  
  if (!is.null(result)) {
    expect_named(result, c("company", "vacancies"))
    
    expect_s3_class(result$company, "data.frame")
    expect_s3_class(result$vacancies, "data.frame")
    
    expect_equal(nrow(result$company), 1)
    expect_true(all(c("company_id", "name", "sector") %in% names(result$company)))
  }
})
