test_that("get_learning_tracks returns expected structure", {
  # Test without filter
  tracks <- get_learning_tracks()
  expect_s3_class(tracks, "data.frame")
  expect_true(all(c("track_id", "title", "description", "url") %in% names(tracks)))
  
  # Test with skill filter (replace with real skill_id if known)
  tracks_filtered <- get_learning_tracks(skill = "skill_r")
  expect_s3_class(tracks_filtered, "data.frame")
  expect_true(all(c("track_id", "title", "description", "url") %in% names(tracks_filtered)))
})
