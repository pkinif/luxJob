#' Get All Companies
#'
#' Returns a data frame of all companies stored in the `adem.companies` table.
#'
#' @param limit Integer. Maximum number of companies to return. Default is 100.
#'
#' @return A data frame with columns `company_id`, `name`, and `sector`.
#' @importFrom glue glue_sql
#' @export
#'
#' @examples
#' \dontrun{
#' get_companies(limit = 50)
#' }
get_companies <- function(limit = 100) {
  con <- connect_db()

  query <- glue::glue_sql("
    SELECT company_id, name, sector
    FROM adem.companies
    ORDER BY name
    LIMIT {limit}
  ", .con = con)
  
  output <- DBI::dbGetQuery(con, query)
  DBI::dbDisconnect(con)
  return(output)
}



#' Get Company Details by ID
#'
#' Returns detailed information about a company, including all its job vacancies.
#'
#' @param company_id Integer. The ID of the company to retrieve.
#'
#' @return A list with two elements:
#' \describe{
#'   \item{company}{A data frame with company info: `company_id`, `name`, `sector`}
#'   \item{vacancies}{A data frame of job vacancies posted by the company}
#' }
#' Returns NULL if the company doesn't exist.
#' @export
#'
#' @examples
#' \dontrun{
#' get_company_details(72)
#' }
get_company_details <- function(company_id) {
  stopifnot(is.numeric(company_id), length(company_id) == 1)
  
  con <- connect_db()

  company <- DBI::dbGetQuery(con, glue::glue_sql("
    SELECT company_id, name, sector
    FROM adem.companies
    WHERE company_id = {company_id}
    LIMIT 1
  ", .con = con))
  
  if (nrow(company) == 0) return(NULL)
  
  vacancies <- DBI::dbGetQuery(con, glue::glue_sql("
    SELECT vacancy_id, canton, occupation, year, month
    FROM adem.vacancies
    WHERE company_id = {company_id}
    ORDER BY year DESC, month DESC
  ", .con = con))
  
  output <- list(company = company, vacancies = vacancies)
  DBI::dbDisconnect(con)
  return(output)
}
