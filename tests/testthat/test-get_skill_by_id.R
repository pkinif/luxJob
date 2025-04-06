test_that("get_skill_by_id returns correct data or NULL", {
  # Try a known skill_id from your dataset
  known_id <- "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9" 
  
  result <- get_skill_by_id(known_id)
  expect_true(is.data.frame(result) || is.null(result))
  
  if (!is.null(result)) {
    expect_equal(nrow(result), 1)
    expect_true(all(c("skill_id", "skill_label") %in% names(result)))
    expect_equal(result$skill_id, known_id)
  }
})
