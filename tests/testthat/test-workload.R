library(testthat)

# Tests for calculate_workload --------------------------------------------
test_that("Workload calculation is somehow incorrect.", {
  expect_equal(calculate_workload(example_courses,
                                  example_sections,
                                  example_instructors),
               example_workload, ignore_attr = TRUE)
})

# Tests for view_workload --------------------------------------------

