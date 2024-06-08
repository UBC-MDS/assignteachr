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
#' with columns instructor, observed_workload, obs_exp_diff, and a column
#' for each session (with the number of credits for that instructor
#' for each session)
#' @export
#'
#' @examples
#' # code to generate example data sets here
#' calculate_workload(mds_courses, mds_sections, mds_instructors)
calculate_workload <- function(courses,
                               sections,
                               instructors) {
  workload <- dplyr::left_join(sections, courses) |>
    dplyr::group_by(instructor, session) |>
    dplyr::summarise(credits = sum(credits, na.rm = TRUE)) |>
    dplyr::add_count(session) |>
    tidyr::pivot_wider(names_from = session, values_from = n) |>
    dplyr::group_by(instructor) |>
    dplyr::summarize(dplyr::across(dplyr::where(is.numeric), ~ sum(.x, na.rm = TRUE))) |>
    dplyr::left_join(instructors, by = dplyr::join_by(instructor == name)) |>
    dplyr::mutate(observed_workload = credits +
             workload_credits*prop_other_work +
             workload_credits*prop_el)

  if ("capstone_groups" %in% colnames(workload)) {
    if (!"S" %in% colnames(workload)) {
      workload <- workload |>
        dplyr::mutate(S = 0)
    }
    workload <- workload |>
      dplyr::mutate(observed_workload = observed_workload +
                      capstone_groups * 0.75,
             S = S + capstone_groups * 0.75)
  }

  workload |>
    dplyr::mutate(obs_exp_diff = observed_workload - workload_credits) |>
    dplyr::select(-credits,
           -position,
           -dplyr::starts_with("prop"),
           -capstone_groups) |>
    dplyr::relocate(dplyr::any_of(c("workload_credits",
                      "observed_workload", "obs_exp_diff")),
                    .after = instructor)
}

#' View Instructor workload
#'
#' @param workload a dataframe returned from calculate_workload
#'
#' @return a grob (ggplot2 object) that is a bar chart
#' with a bar for each instructor with the height being mapped to workload
#' And a doughnut plot for teaching for each session being mapped to a colour.
#'
#' @export
#'
#' @examples
#' # code to generate example workload dataframe here
#' view_workload(2023_mds_workload)
view_workload <- function(workload) {
  # returns a grob visualizing instructor workload
}
