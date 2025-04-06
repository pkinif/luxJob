#' Get Book Recommendations
#'
#' Returns a list of recommended books. You can filter them by skill.
#'
#' @param skill Optional. Character. A `skill_id` to filter recommendations.
#'
#' @return A data frame with columns `book_id`, `title`, `author`, and `skill_id`.
#' @export
#'
#' @examples
#' \dontrun{
#' get_books()
#' get_books(skill = "http://data.europa.eu/esco/skill/70198e4e-86ad-4acc-a9eb-e24e2c107d18")
#' }
get_books <- function(skill = NULL) {
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  
  if (is.null(skill)) {
    query <- "SELECT book_id, title, author, skill_id FROM adem.book_recommendations ORDER BY title"
  } else {
    query <- glue::glue_sql("
      SELECT book_id, title, author, skill_id
      FROM adem.book_recommendations
      WHERE skill_id = {skill}
      ORDER BY title
    ", .con = con)
  }
  
  return(DBI::dbGetQuery(con, query))
}



#' Get Book Recommendation by ID
#'
#' Returns a single book recommendation with its associated skill.
#'
#' @param book_id Integer. The ID of the book to retrieve.
#'
#' @return A data frame with one row: `book_id`, `title`, `author`, `skill_id`.
#' Returns an empty data frame if not found.
#' @export
#'
#' @examples
#' \dontrun{
#' get_book_by_id(101)
#' }
get_book_by_id <- function(book_id) {
  stopifnot(is.numeric(book_id), length(book_id) == 1)
  
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  
  query <- glue::glue_sql("
    SELECT book_id, title, author, skill_id
    FROM adem.book_recommendations
    WHERE book_id = {book_id}
    LIMIT 1
  ", .con = con)
  
  return(DBI::dbGetQuery(con, query))
}
