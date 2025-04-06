test_that("get_vacancies returns expected structure", {
  vacancies <- get_vacancies(limit = 10)
  expect_s3_class(vacancies, "data.frame")
  expect_true(all(c("vacancy_id", "company_id", "occupation", "canton", "year", "month") %in% names(vacancies)))
})

test_that("get_vacancies filters by skill and canton", {
  vacancies <- get_vacancies(
    skill = "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9",
    canton = "Luxembourg",
    limit = 5
  )
  expect_s3_class(vacancies, "data.frame")
  expect_true(all(c("vacancy_id", "canton") %in% names(vacancies)))
})
