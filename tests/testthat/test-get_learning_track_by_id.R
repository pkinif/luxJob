# test_that("get_learning_track_by_id returns a list", {
#   result <- get_learning_track_by_id(71)
#   expect_true(is.list(result))
# })
# 
# test_that("get_learning_track_by_id returns a named list with 'track' and 'skills'", {
#   result <- get_learning_track_by_id(71)
#   expect_named(result, c("track", "skills"))
# })
# 
# test_that("get_learning_track_by_id$track is a data frame", {
#   result <- get_learning_track_by_id(71)
#   expect_s3_class(result$track, "data.frame")
# })
# 
# test_that("get_learning_track_by_id$track has exactly one row", {
#   result <- get_learning_track_by_id(71)
#   expect_equal(nrow(result$track), 1)
# })
# 
# test_that("get_learning_track_by_id$track has expected columns", {
#   result <- get_learning_track_by_id(71)
#   expected_cols <- c("track_id", "title", "description", "url")
#   expect_true(all(expected_cols %in% names(result$track)))
# })
# 
# test_that("get_learning_track_by_id$skills has expected columns", {
#   result <- get_learning_track_by_id(71)
#   expected_cols <- c("skill_id", "skill_label")
#   expect_true(all(expected_cols %in% names(result$skills)))
# })
