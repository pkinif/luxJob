test_that("get_vacancies returns a data frame", {
  vacancies <- get_vacancies(limit = 10)
  expect_s3_class(vacancies, "data.frame")
})

test_that("get_vacancies returns expected columns", {
  vacancies <- get_vacancies(limit = 10)
  expected_cols <- c("vacancy_id", "company_id", "occupation", "canton", "year", "month")
  expect_true(all(expected_cols %in% names(vacancies)))
})

test_that("get_vacancies with skill and canton returns a data frame", {
  vacancies <- get_vacancies(
    skill = "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9",
    canton = "Luxembourg",
    limit = 5
  )
  expect_s3_class(vacancies, "data.frame")
})

test_that("get_vacancies with skill and canton returns expected columns", {
  vacancies <- get_vacancies(
    skill = "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9",
    canton = "Luxembourg",
    limit = 5
  )
  expected_cols <- c("vacancy_id", "canton")
  expect_true(all(expected_cols %in% names(vacancies)))
})
