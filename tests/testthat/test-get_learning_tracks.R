
test_that("get_learning_tracks returns expected structure", {
  # Test without filter
  tracks <- get_learning_tracks()
  expect_s3_class(tracks, "data.frame")
  expect_true(all(c("track_id", "title", "description", "url") %in% names(tracks)))
  
  # Test with skill_id filter (replace with real skill_id if needed)
  skill = 'http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9'
  tracks_filtered <- get_learning_tracks(skill_id = skill)
  expect_s3_class(tracks_filtered, "data.frame")
  expect_true(all(c("track_id", "title", "description", "url") %in% names(tracks_filtered)))
})