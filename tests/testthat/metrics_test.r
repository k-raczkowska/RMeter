testthat::test_that('longest chain test', {
  data = data.frame(c(1,2,3,4), c('passed', 'passed', 'errored', 'passed'))
  data2 = data.frame(c(1), c('passed'))
  data3 = data.frame(c(1), c('errored'))
  data4 = data.frame(c(1,2,3,4,5,6), c('failed', 'errored', 'passed', 'passed', 'passed', 'failed'))
  data5 = data.frame(c(1,2,3,4,5,6,7,8,9), c('passed', 'passed', 'failed', 'passed', 'errored', 'passed', 'passed', 'passed', 'failed'))
  testthat::expect_equal(shortestChainArray(data5, 'passed'), 1)
  
  testthat::expect_equal(longestChainArray(data, 'passed'), 2)
  testthat::expect_equal(longestChainArray(data, 'errored'), 1)
  testthat::expect_equal(longestChainArray(data, 'failed'), 0)
  
  testthat::expect_equal(longestChainArray(data2, 'passed'), 1)
  testthat::expect_equal(longestChainArray(data2, 'errored'), 0)
  testthat::expect_equal(longestChainArray(data2, 'failed'), 0)
  
  testthat::expect_equal(longestChainArray(data3, 'passed'), 0)
  testthat::expect_equal(longestChainArray(data3, 'errored'), 1)
  testthat::expect_equal(longestChainArray(data3, 'failed'), 0)
  
  testthat::expect_equal(longestChainArray(data4, 'passed'), 3)
  testthat::expect_equal(longestChainArray(data4, 'errored'), 1)
  testthat::expect_equal(longestChainArray(data4, 'failed'), 1)
  
  testthat::expect_equal(shortestChainArray(data, 'failed'), 0)
  testthat::expect_equal(shortestChainArray(data4, 'passed'), 3)
})
