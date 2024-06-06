library(dplyr)

example_courses <- tribble(
  ~course_code, ~course_number, ~credits, ~academic_units,
  "DSCI",       511,            1.5,      "MDS",
  "DSCI",       521,            1.5,      "MDS",
  "DSCI",       100,            3,        "STAT"
)

example_sections <- tribble(
  ~course_code, ~course_number, ~section_number, ~enrollment, ~session, ~first_time_multiplier, ~redevelopment_multiplier, ~instructor,
  "DSCI",       511,            "001",           100,         "W1",       NA,                     NA,                        "Bob Smith",
  "DSCI",       511,            "L01",           100,         "W1",       NA,                     NA,                        "Bob Smith",
  "DSCI",       511,            "L02",           100,         "W1",       NA,                     NA,                        "Sarah Appsley",
  "DSCI",       521,            "001",           100,         "W1",       NA,                     NA,                        "George Monker",
  "DSCI",       521,            "L01",           100,         "W1",       NA,                     NA,                        "George Monker",
  "DSCI",       521,            "L02",           100,         "W1",       NA,                     NA,                        "George Monker",
  "DSCI",       100,            "001",           100,         "W2",       NA,                     NA,                        "Tara Trutch"
)

#' @param instructors a data frame where each row is an instructor
#' with columns name, position, workload_credits,
#' prop_el, prop_other_work, and optional capstone_groups

example_instructors <- tribble(
  ~name,           ~position,      ~workload_credits, ~prop_teaching, ~prop_other_work, ~prop_el, ~capstone_groups,
  "Bob Smith",     "Lecturer",     15,                0.9,            0,                0.1,      3,
  "Sarah Appsley", "TLF",          15,                0.9,            0,                0.1,      2,
  "George Monker", "Lecturer",     15,                0.9,            0,                0.1,      3,
  "Tara Trutch",   "Tenure-track", 15,                0.8,            0,                0.1,      1
)
