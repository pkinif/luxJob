# Without filter
test_that("get_learning_tracks returns a data frame without filter", {
  tracks <- get_learning_tracks()
  expect_s3_class(tracks, "data.frame")
})

test_that("get_learning_tracks returns expected columns without filter", {
  tracks <- get_learning_tracks()
  expected_cols <- c("track_id", "title", "description", "url")
  expect_true(all(expected_cols %in% names(tracks)))
})

# With skill_id filter
test_that("get_learning_tracks returns a data frame with skill_id filter", {
  skill <- "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9"
  tracks_filtered <- get_learning_tracks(skill_id = skill)
  expect_s3_class(tracks_filtered, "data.frame")
})

test_that("get_learning_tracks returns expected columns with skill_id filter", {
  skill <- "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9"
  tracks_filtered <- get_learning_tracks(skill_id = skill)
  expected_cols <- c("track_id", "title", "description", "url")
  expect_true(all(expected_cols %in% names(tracks_filtered)))
})
