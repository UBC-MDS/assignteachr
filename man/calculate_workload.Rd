% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/workload.R
\name{calculate_workload}
\alias{calculate_workload}
\title{Calculate Instructor Workload}
\usage{
calculate_workload(courses, sections, instructors)
}
\arguments{
\item{courses}{a data frame where each row is a course
contains columns course_code course_number,
credits, academic_unit}

\item{sections}{a data frame where each row is a section
section_number, student_composition,
session (e.g., term or block), first_time_instructor,
redevelopment_multiplier, instructor}

\item{instructors}{a data frame where each row is an instructor
with columns name, position, workload_credits,
prop_el, prop_other_work, and optional capstone_groups}
}
\value{
a data frame with instructor workload each row is an instructor
with columns instructor, observed_workload, obs_exp_diff, and a column
for each session (with the number of credits for that instructor
for each session)
}
\description{
Calculate Instructor Workload
}
\examples{
# code to generate example data sets here
calculate_workload(mds_courses, mds_sections, mds_instructors)
}
