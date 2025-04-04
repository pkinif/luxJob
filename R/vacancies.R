#' Get Job Vacancies
#'
#' Returns a filtered list of job vacancies. You can filter by skill, company, and/or canton.
#'
#' @param skill Optional. Character. A `skill_id` to filter vacancies by required skill.
#' @param company Optional. Integer. A `company_id` to filter vacancies by company.
#' @param canton Optional. Character. A canton name to filter vacancies by location.
#' @param limit Optional. Integer. Max number of results (default = 100).
#'
#' @return A data frame of vacancies including `vacancy_id`, `company_id`, `occupation`, `canton`, `year`, and `month`.
#' @export
#'
#' @examples
#' \dontrun{
#' get_vacancies(skill = "skill_123", canton = "LUX", limit = 50)
#' }
get_vacancies <- function(skill = NULL, company = NULL, canton = NULL, limit = 100) {
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  
  where_clauses <- c()
  
  if (!is.null(skill)) {
    where_clauses <- c(where_clauses, glue::glue_sql(
      "vacancy_id IN (SELECT vacancy_id FROM adem.vacancy_skills WHERE skill_id = {skill})", .con = con
    ))
  }
  
  if (!is.null(company)) {
    where_clauses <- c(where_clauses, glue::glue_sql(
      "company_id = {company}", .con = con
    ))
  }
  
  if (!is.null(canton)) {
    where_clauses <- c(where_clauses, glue::glue_sql(
      "canton = {canton}", .con = con
    ))
  }
  
  sql_where <- if (length(where_clauses) > 0) {
    glue::glue_sql("WHERE ", .con = con) %>%
      paste0(paste(where_clauses, collapse = " AND "))
  } else {
    ""
  }
  
  query <- glue::glue_sql("
    SELECT vacancy_id, company_id, canton, occupation, year, month
    FROM adem.vacancies
    {`sql_where`}
    ORDER BY year DESC, month DESC
    LIMIT {limit}
  ", .con = con)
  
  DBI::dbGetQuery(con, query)
}



#' Get Vacancy by ID
#'
#' Returns detailed information about a vacancy, including required skills.
#'
#' @param vacancy_id Integer or numeric. The ID of the vacancy to retrieve.
#'
#' @return A list with two elements:
#' \describe{
#'   \item{vacancy}{A data frame with vacancy details: `vacancy_id`, `company_id`, `canton`, `occupation`, `year`, `month`}
#'   \item{skills}{A data frame of `skill_id`, `skill_label` required for the vacancy}
#' }
#' Returns NULL if no vacancy is found.
#' @export
#'
#' @examples
#' \dontrun{
#' get_vacancy_by_id(456789)
#' }
get_vacancy_by_id <- function(vacancy_id) {
  stopifnot(is.numeric(vacancy_id), length(vacancy_id) == 1)
  
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  
  vacancy <- DBI::dbGetQuery(con, glue::glue_sql("
    SELECT vacancy_id, company_id, canton, occupation, year, month
    FROM adem.vacancies
    WHERE vacancy_id = {vacancy_id}
    LIMIT 1
  ", .con = con))
  
  if (nrow(vacancy) == 0) return(NULL)
  
  skills <- DBI::dbGetQuery(con, glue::glue_sql("
    SELECT vs.skill_id, s.skill_label
    FROM adem.vacancy_skills vs
    JOIN adem.skills s ON vs.skill_id = s.skill_id
    WHERE vs.vacancy_id = {vacancy_id}
    ORDER BY s.skill_label
  ", .con = con))
  
  list(vacancy = vacancy, skills = skills)
}
