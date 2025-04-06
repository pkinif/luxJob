test_that("get_vacancy_by_id returns a valid vacancy or NULL", {
  # Replace with a known vacancy_id from your DB
  known_id <- 430613264
  
  result <- get_vacancy_by_id(known_id)
  
  expect_true(is.list(result) || is.null(result))
  
  if (!is.null(result)) {
    expect_named(result, c("vacancy", "skills"))
    
    expect_s3_class(result$vacancy, "data.frame")
    expect_equal(nrow(result$vacancy), 1)
    expect_true(all(c("vacancy_id", "company_id", "occupation", "canton", "year", "month") %in% names(result$vacancy)))
    
    expect_s3_class(result$skills, "data.frame")
    expect_true(all(c("skill_id", "skill_label") %in% names(result$skills)))
  }
})
