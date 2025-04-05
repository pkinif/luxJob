test_that("get_skills returns a data frame with expected columns", {
  skills <- get_skills(limit = 5)
  
  expect_s3_class(skills, "data.frame")
  expect_true(all(c("skill_id", "skill_label") %in% names(skills)))
  expect_lte(nrow(skills), 5)
})
