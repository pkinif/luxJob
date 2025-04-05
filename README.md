
<!-- README.md is generated from README.Rmd. Please edit that file -->

# luxJob <img src="man/figures/logo.png" align="right" height="120" />

`luxJob` is an internal R package that provides access to the ADEM job
and training data, stored in a PostgreSQL database.

It powers the backend of an API built with Plumber, offering: -
Filterable vacancy search - Learning track recommendations - Company and
book lookup endpoints

## 🚀 Installation

``` r
# Clone or download the repo
remotes::install_github("pkinif/luxJob")
```

## 🔌 Connect to the database

``` r
con <- luxJob::connect_db()
vacancies <- luxJob::get_vacancies(limit = 10)
```

Make sure your `.Renviron` contains:

    PG_DB=yourdbname
    PG_HOST=yourhost
    PG_USER=youruser
    PG_PASSWORD=yourpassword

## 📦 Functions Overview

| Function                     | Description              |
|------------------------------|--------------------------|
| `get_skills()`               | List all skills          |
| `get_skill_by_id()`          | Skill details            |
| `get_companies()`            | List companies           |
| `get_company_details()`      | Company + vacancies      |
| `get_vacancies()`            | Filtered vacancy search  |
| `get_vacancy_by_id()`        | Vacancy details          |
| `get_learning_tracks()`      | Learning tracks by skill |
| `get_learning_track_by_id()` | Track + skill list       |
| `get_books()`                | Book recommendations     |
| `get_book_by_id()`           | Book details             |
| `log_search()`               | Log user queries         |

## 🧪 Status

- [x] API-ready functions
- [x] Secure DB connection
- [x] Ready for Plumber integration
