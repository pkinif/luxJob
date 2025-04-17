test_that("get_skill_by_id returns a data frame", {
  skill_id <- "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9"
  result <- get_skill_by_id(skill_id)
  expect_s3_class(result, "data.frame")
})

test_that("get_skill_by_id returns exactly one row", {
  skill_id <- "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9"
  result <- get_skill_by_id(skill_id)
  expect_equal(nrow(result), 1)
})

test_that("get_skill_by_id returns expected columns", {
  skill_id <- "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9"
  result <- get_skill_by_id(skill_id)
  expected_cols <- c("skill_id", "skill_label")
  expect_true(all(expected_cols %in% names(result)))
})

test_that("get_skill_by_id returns correct skill_id", {
  skill_id <- "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9"
  result <- get_skill_by_id(skill_id)
  expect_equal(result$skill_id, skill_id)
})
