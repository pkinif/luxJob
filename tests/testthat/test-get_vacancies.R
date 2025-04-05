test_that("get_vacancies returns a filtered or full vacancy list", {
  # Test default: no filters
  vacs <- get_vacancies(limit = 10)
  expect_s3_class(vacs, "data.frame")
  expect_true(all(c("vacancy_id", "company_id", "canton", "occupation", "year", "month") %in% names(vacs)))
  expect_lte(nrow(vacs), 10)
  
  # Test with example filter (replace with known skill_id/canton if available)
  vacs_filtered <- get_vacancies(skill = "skill_r", canton = "LUX", limit = 5)
  expect_s3_class(vacs_filtered, "data.frame")
  expect_lte(nrow(vacs_filtered), 5)
})
