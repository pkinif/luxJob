#' Adjust API Quota for a Given Token
#'
#' Decreases the quota by 1 for the user identified by a given API token.
#' Ensures the quota does not fall below 0 and throws an error if the token is not found or the quota is already exhausted.
#'
#' @param token A character string representing the API token of the user.
#' @param schema A character string specifying the schema name in the PostgreSQL database. Default is `'adem'`.
#'
#' @return Returns `TRUE` if the quota was successfully updated.
#' @export
#'
#' @examples
#' \dontrun{
#' adjust_quota("abc123")
#' adjust_quota("xyz789", schema = "public")
#' }
adjust_quota <- function(token, schema = 'adem') {
  con <- connect_db()
  
  # Fetch current quota
  query <- glue::glue_sql(
    "SELECT quota FROM {`schema`}.api_users WHERE token = {token}",
    .con = con
  )
  current_quota <- DBI::dbGetQuery(con, query)$quota
  
  if (length(current_quota) == 0) {
    stop("Token not found in quota table.")
  }
  
  if (current_quota <= 0) {
    stop("Quota has already been exhausted.")
  }
  
  # Subtract 1, ensuring it doesn't go below 0
  new_quota <- max(current_quota - 1, 0)
  
  # Update the quota
  update_query <- glue::glue_sql(
    "UPDATE {`schema`}.api_users SET quota = {new_quota} WHERE token = {token}",
    .con = con
  )
  
  DBI::dbExecute(con, update_query)
  # Close the connection
  DBI::dbDisconnect(con)
  
  return(TRUE)
}
