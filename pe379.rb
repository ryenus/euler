require 'minitest/spec'
require 'benchmark'
require 'prime'

# 6.pd = [[2,1],[3,1]]
# f(6) = [2,3],


class Integer
  alias :pd :prime_division
end

def f(n)
  pd = n.pd
  pd.length * pd.reduce(0){|s,a| s + a[1]}
end

def g(n)
  1.upto(n).reduce(0) {|s, i| s + f(i)}
end

def assert_equal(expected, actual)
  expected == actual ? true : "failure: expected #{expected} != actual #{actual}"
end

def test
  report = []
  report << assert_equal(1, f(5))
  report << assert_equal(4, f(6))
  report << assert_equal(2, f(25))
  report << assert_equal(37429395, g(10**6))
  report
end

def search(n=4)
  res = []
  res.uniq.map(&:to_i)
end

Benchmark.bm do |b|
  b.report { puts "test result => #{test}" }
  #b.report { puts "result => #{search}" }
end

=begin
user     system      total        real
 result => [148748178147, 296962999629]
  0.327000   0.000000   0.327000 (  0.339020)
=end
