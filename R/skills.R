#' Get All Skills
#'
#' Returns a data frame of all skills stored in the `adem.skills` table.
#' Used by the API endpoint `GET /skills`.
#'
#' @param limit Integer. Maximum number of skills to return. Default is 100.
#' @return A data frame with columns `skill_id` and `skill_label`.
#' @export
#'
#' @examples
#' \dontrun{
#' con <- connect_db()
#' get_skills(limit = 20)
#' }
get_skills <- function(limit = 100) {
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  
  query <- glue::glue_sql("
    SELECT skill_id, skill_label
    FROM adem.skills
    ORDER BY skill_label
    LIMIT {limit}
  ", .con = con)
  
  DBI::dbGetQuery(con, query)
}


#' Get Skill by ID
#'
#' Returns a single skill based on its ID from the `adem.skills` table.
#'
#' @param skill_id A character string. The ID of the skill to retrieve.
#'
#' @return A data frame with one row and columns `skill_id`, `skill_label`, or an empty data frame if not found.
#' @export
#'
#' @examples
#' \dontrun{
#' get_skill_by_id("http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9")
#' }
get_skill_by_id <- function(skill_id) {
  stopifnot(is.character(skill_id), length(skill_id) == 1)
  
  con <- connect_db()

  query <- glue::glue_sql("
    SELECT skill_id, skill_label
    FROM adem.skills
    WHERE skill_id = {skill_id}
    LIMIT 1
  ", .con = con)
  
  output <- DBI::dbGetQuery(con, query)
  DBI::dbDisconnect(con)
  return(output)
}

