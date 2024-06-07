#' Calculate Instructor Workload
#'
#' @param courses a data frame where each row is a course
#' contains columns course_code course_number,
#' credits, academic_unit
#' @param sections a data frame where each row is a section
#' section_number, student_composition,
#' session (e.g., term or block), first_time_instructor,
#' redevelopment_multiplier, instructor
#' @param instructors a data frame where each row is an instructor
#' with columns name, position, workload_credits,
#' prop_el, prop_other_work, and optional capstone_groups
#'
#' @return a data frame with instructor workload each row is an instructor
#' with columns instructor, observed_workload, obs_exp_diff
#' @export
#'
#' @examples
#' # code to generate example data sets here
#' calculate_workload(mds_courses, mds_sections, mds_instructors)
calculate_workload <- function(courses, sections, instructors) {
  left_join(sections, courses) |>
    group_by(instructor, session) |>
    summarise(credits = sum(credits)) |>
    group_by(instructor) |>
    summarise(gini_coef = ineq(credits),
              credits = sum(credits)) |>
    left_join(instructors, by = join_by(instructor == name)) |>
    mutate(observed_workload = credits +
             workload_credits*prop_other_work +
             workload_credits*prop_el +
             capstone_groups * 0.75,
           obs_exp_diff = observed_workload - workload_credits) |>
    select(instructor,
           workload_credits,
           observed_workload,
           obs_exp_diff,
           gini_coef)
}

#' View Instructor workload
#'
#' @param workload a dataframe returned from calculate_workload
#'
#' @return a grob (ggplot2 object) that is a stacked bar chart
#' with a bar for each instructor and their workload proportions
#' mapped to colour
#'
#' @export
#'
#' @examples
#' # code to generate example workload dataframe here
#' view_workload(2023_mds_workload)
view_workload <- function(workload) {
  # returns a grob visualizing instructor workload
}
