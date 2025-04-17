# test_that("get_vacancy_by_id returns a list", {
#   result <- get_vacancy_by_id(430613264)
#   expect_true(is.list(result))
# })
# 
# test_that("get_vacancy_by_id returns named list with 'vacancy' and 'skills'", {
#   result <- get_vacancy_by_id(430613264)
#   expect_named(result, c("vacancy", "skills"))
# })
# 
# test_that("get_vacancy_by_id$vacancy is a data frame", {
#   result <- get_vacancy_by_id(430613264)
#   expect_s3_class(result$vacancy, "data.frame")
# })
# 
# test_that("get_vacancy_by_id$vacancy has exactly one row", {
#   result <- get_vacancy_by_id(430613264)
#   expect_equal(nrow(result$vacancy), 1)
# })
# 
# test_that("get_vacancy_by_id$vacancy has expected columns", {
#   result <- get_vacancy_by_id(430613264)
#   expected_cols <- c("vacancy_id", "company_id", "occupation", "canton", "year", "month")
#   expect_true(all(expected_cols %in% names(result$vacancy)))
# })
# 
# test_that("get_vacancy_by_id$skills is a data frame", {
#   result <- get_vacancy_by_id(430613264)
#   expect_s3_class(result$skills, "data.frame")
# })
# 
# test_that("get_vacancy_by_id$skills has expected columns", {
#   result <- get_vacancy_by_id(430613264)
#   expected_cols <- c("skill_id", "skill_label")
#   expect_true(all(expected_cols %in% names(result$skills)))
# })
