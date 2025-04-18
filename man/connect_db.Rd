% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/connect_db.R
\name{connect_db}
\alias{connect_db}
\title{Connect to the ADEM PostgreSQL Database}
\usage{
connect_db()
}
\value{
A DBI connection object (class `"PqConnection"`)
}
\description{
Establishes a connection to the PostgreSQL database using credentials
and host information stored in environment variables. This function is used
internally by other functions that need to interact with the ADEM database.
}
\details{
Environment variables expected:
- PG_DB: database name
- PG_HOST: database host
- PG_USER: database username
- PG_PASSWORD: database password
}
\examples{
\dontrun{
con <- connect_db()
DBI::dbListTables(con)
DBI::dbDisconnect(con)
}
}
