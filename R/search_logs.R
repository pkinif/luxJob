#' Log a User Search Query
#'
#' Records a search query made by a user into the `adem.search_logs` table.
#'
#' @param user_id Integer. The user’s unique ID.
#' @param query Character. The text of the query to log.
#'
#' @return Logical value. TRUE if logging was successful, FALSE otherwise.
#' @export
#'
#' @examples
#' \dontrun{
#' log_search(user_id = 1, query = "machine learning jobs in Luxembourg")
#' }
log_search <- function(user_id, query, schema = "adem") {
  if (!is.numeric(user_id) || length(user_id) != 1) return(FALSE)
  if (!is.character(query) || nchar(query) == 0) return(FALSE)
  
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con))
  
  sql <- glue::glue_sql("
  INSERT INTO {`schema`}.search_logs (user_id, query)
  VALUES ({user_id}, {query})
", .con = con)
  
  tryCatch({
    DBI::dbExecute(con, sql)
    TRUE
  }, error = function(e) {
    FALSE
  })
}
