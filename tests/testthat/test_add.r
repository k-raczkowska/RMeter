context('addition tests')

test_that('1 + 1 = 2', {
  expect_equal(2, addition(1,1))
  expect_equal(10, addition(-5,15))
})
