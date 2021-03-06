context('freq_cont')

test_that('output from freq_cont matches expected result', {

  k <- freq_cont(mtcars$mpg, bins = 4)
  expect_equivalent(k$breaks, c(10.400, 16.275, 22.150, 28.025, 33.900))
  expect_equivalent(k$frequency, c(10, 13, 5, 4))
  expect_equivalent(k$cumulative, c(10, 23, 28, 32))
  expect_equivalent(k$percent, c(31.25, 40.62, 15.62, 12.50))
  expect_equivalent(k$cum_percent, c(31.25, 71.88, 87.50, 100.00))
  expect_equal(k$bins, 4)
  expect_equal(k$data, mtcars$mpg)
  expect_equivalent(k$varname, "mpg")

})

test_that('freq_cont returns appropriate errors', {

  expect_error(freq_cont('mtcars$mpg'), 'data must be numeric')
  expect_error(freq_cont(as.factor(mtcars$mpg)), 'data must be numeric')
  expect_error(freq_cont(mtcars$mpg, '5'), 'bins must be integer value')

})
