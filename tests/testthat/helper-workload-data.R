library(dplyr)

# Example input data ------------------------------------------------------
example_courses <- tribble(
  ~course_code, ~course_number, ~credits, ~academic_units,
  "DSCI",       511,            0.5,     "MDS",
  "DSCI",       521,            0.5,     "MDS",
  "DSCI",       100,            3,        "STAT"
)

example_sections <- tribble(
  ~course_code, ~course_number, ~section_number, ~enrollment, ~session, ~first_time_multiplier, ~redevelopment_multiplier, ~instructor,
  "DSCI",       511,            "001",           100,         "W1",       NA,                     NA,                        "Bob Smith",
  "DSCI",       511,            "L01",           100,         "W1",       NA,                     NA,                        "Bob Smith",
  "DSCI",       511,            "L02",           100,         "W1",       0.5,                    NA,                        "Sarah Appsley",
  "DSCI",       521,            "001",           100,         "W1",       NA,                     NA,                        "George Monker",
  "DSCI",       521,            "L01",           100,         "W1",       NA,                     NA,                        "George Monker",
  "DSCI",       521,            "L02",           100,         "W1",       NA,                     NA,                        "George Monker",
  "DSCI",       100,            "001",           100,         "W2",       NA,                     NA,                        "Tara Trutch",
  "DSCI",       100,            "002",           100,         "W2",       NA,                     0.25,                      "George Monker"
)

#' @param instructors a data frame where each row is an instructor
#' with columns name, position, workload_credits,
#' prop_el, prop_other_work, and optional capstone_groups

example_instructors <- tribble(
  ~name,           ~position,      ~workload_credits, ~prop_teaching, ~prop_other_work, ~prop_el, ~capstone_groups,
  "Bob Smith",     "Lecturer",     15,                0.9,            0,                0.1,      3,
  "Sarah Appsley", "TLF",          15,                0.9,            0,                0.1,      2,
  "George Monker", "Lecturer",     15,                0.7,            0.2,              0.1,      3,
  "Tara Trutch",   "Tenure-track", 15,                0.8,            0.2,                0,      1
)

# Expected outputs for calculate_workload ---------------------------------
#columns instructor, expected_workload, observed_workload, obs_exp_diff, gini_coef
# Workload for George Monker
# Workload for Tara Trutch
example_workload <- tribble(
  ~instructor,      ~expected_workload, ~observed_workload, ~obs_exp_diff,  ~W1, ~W2, ~S,
  "Bob Smith",      15,                 4.75,               -10.25,         1,   0,   2.25,
  "George Monker",  15,                 12,                 -3,             1,   1,   2.25,
  "Sarah Appsley",  15,                 3.75,               -11.25,         1,   0,   1.5,
  "Tara Trutch",    15,                 6.75,               -8.25,          0,   1,   0.75
)


# Expected use cases for view_workload-------------------------------------

# Viz for Bob Smith

# Viz for Sarah Appsley

# Viz for George Monker

#Viz for Tara Trutch

