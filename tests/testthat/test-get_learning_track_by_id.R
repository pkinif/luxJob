test_that("get_learning_track_by_id returns a track and skills or NULL", {
  known_id <- 71
  
  result <- get_learning_track_by_id(known_id)
  
  expect_true(is.list(result) || is.null(result))
  
  if (!is.null(result)) {
    expect_named(result, c("track", "skills"))
    
    expect_s3_class(result$track, "data.frame")
    expect_equal(nrow(result$track), 1)
    expect_true(all(c("track_id", "title", "description", "url") %in% names(result$track)))
    
    expect_s3_class(result$skills, "data.frame")
    expect_true(all(c("skill_id", "skill_label") %in% names(result$skills)))
  }
})
