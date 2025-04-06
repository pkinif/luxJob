#' Get Learning Tracks
#'
#' Returns a list of learning tracks, optionally filtered by a required skill.
#'
#' @param skill_id Optional. Character. A `skill_id` to filter learning tracks that teach this skill.
#'
#' @return A data frame with columns `track_id`, `title`, `description`, and `url`.
#' @export
#'
#' @examples
#' \dontrun{
#' get_learning_tracks()
#' get_learning_tracks(skill_id = "http://data.europa.eu/esco/skill/d8903406-abc4-48be-9b2e-5d8ddf103bd9")
#' }
get_learning_tracks <- function(skill_id = NULL) {
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  
  if (is.null(skill_id)) {
    query <- "
      SELECT track_id, title, description, url
      FROM adem.learning_tracks
      ORDER BY title
    "
  } else {
    query <- glue::glue_sql("
      SELECT t.track_id, t.title, t.description, t.url
      FROM adem.learning_tracks t
      JOIN adem.track_skills ts ON t.track_id = ts.track_id
      WHERE ts.skill_id = {skill_id}
      ORDER BY t.title
    ", .con = con)
  }
  
  DBI::dbGetQuery(con, query)
}



#' Get Learning Track by ID
#'
#' Returns a specific learning track and the skills it covers.
#'
#' @param track_id Integer. The ID of the learning track to retrieve.
#'
#' @return A list with two elements:
#' \describe{
#'   \item{track}{A data frame with columns: `track_id`, `title`, `description`, `url`}
#'   \item{skills}{A data frame with columns: `skill_id`, `skill_label`}
#' }
#' Returns NULL if the track is not found.
#' @export
#'
#' @examples
#' \dontrun{
#' get_learning_track_by_id(71)
#' }
get_learning_track_by_id <- function(track_id) {
  stopifnot(is.numeric(track_id), length(track_id) == 1)
  
  con <- connect_db()
  on.exit(DBI::dbDisconnect(con), add = TRUE)
  
  track <- DBI::dbGetQuery(con, glue::glue_sql("
    SELECT track_id, title, description, url
    FROM adem.learning_tracks
    WHERE track_id = {track_id}
    LIMIT 1
  ", .con = con))
  
  if (nrow(track) == 0) return(NULL)
  
  skills <- DBI::dbGetQuery(con, glue::glue_sql("
    SELECT s.skill_id, s.skill_label
    FROM adem.track_skills ts
    JOIN adem.skills s ON ts.skill_id = s.skill_id
    WHERE ts.track_id = {track_id}
    ORDER BY s.skill_label
  ", .con = con))
  
  return(list(track = track, skills = skills))
}

