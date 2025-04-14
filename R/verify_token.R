#' Verify a bearer token
#'
#' Checks if a given bearer token exists in the `api_users` table of a specified schema.
#'
#' @param token A character string representing the bearer token to validate.
#'              This parameter is required.
#' @param schema A character string representing the schema where the `api_users` table is located.
#'               Defaults to `'adem'`.
#'
#' @return `TRUE` if the token is found in the database, `FALSE` otherwise.
#' @export
verify_token <- function(token, schema = 'adem') {
  con <- connect_db()
  
  query <- glue::glue_sql(
    "SELECT * FROM {`schema`}.api_users WHERE token = {token}",
    .con = con
  )
  
  response <- DBI::dbGetQuery(con, query)
  DBI::dbDisconnect(con)
  if (nrow(response) > 0) {
    TRUE
  } else {
    FALSE
  }
}
