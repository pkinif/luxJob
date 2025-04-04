#' Connect to the ADEM PostgreSQL Database
#'
#' Establishes a connection to the PostgreSQL database using credentials
#' and host information stored in environment variables. This function is used
#' internally by other functions that need to interact with the ADEM database.
#'
#' Environment variables expected:
#' - PG_DB: database name
#' - PG_HOST: database host
#' - PG_USER: database username
#' - PG_PASSWORD: database password
#'
#' @return A DBI connection object (class `"PqConnection"`)
#' @export
#'
#' @examples
#' \dontrun{
#' con <- connect_db()
#' DBI::dbListTables(con)
#' DBI::dbDisconnect(con)
#' }
connect_db <- function() {
  con <- DBI::dbConnect(
    RPostgres::Postgres(),
    dbname = Sys.getenv("PG_DB"),
    host = Sys.getenv("PG_HOST"),
    user = Sys.getenv("PG_USER"),
    password = Sys.getenv("PG_PASSWORD"),
    port = 5432
  )
  return(con)
}
