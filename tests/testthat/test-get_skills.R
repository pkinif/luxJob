# test_that("get_skills returns a data frame", {
#   skills <- get_skills(limit = 5)
#   expect_s3_class(skills, "data.frame")
# })
# 
# test_that("get_skills returns expected columns", {
#   skills <- get_skills(limit = 5)
#   expected_cols <- c("skill_id", "skill_label")
#   expect_true(all(expected_cols %in% names(skills)))
# })
# 
# test_that("get_skills respects the limit parameter", {
#   skills <- get_skills(limit = 5)
#   expect_lte(nrow(skills), 5)
# })
