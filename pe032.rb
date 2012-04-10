require 'benchmark'
require 'set'

NUMBERS = (1..9).to_a

def pan_digital
  sum = Set.new
  NUMBERS.permutation do |n1, n2, n3, n4, n5, n6, n7, n8, n9|
    prod = n6*1000 + n7*100 + n8*10 + n9
    m1, m4 = n1, n2*1000 + n3*100 + n4*10 + n5
    m2, m3 = n1*10 + n2, n3*100 + n4*10 + n5
    sum << prod if m1 * m4 == prod
    sum << prod if m2 * m3 == prod
  end
  p sum.sort
  sum.reduce :+
end

Benchmark.bm 15 do |b|
  b.report('search') { puts "search sum => #{pan_digital}" }
end

=begin
user     system      total        real
search
12 * 483 => 5796
18 * 297 => 5346
27 * 198 => 5346
28 * 157 => 4396
39 * 186 => 7254
4 * 1738 => 6952
4 * 1963 => 7852
42 * 138 => 5796
48 * 159 => 7632
#<Set: {5796, 5346, 4396, 7254, 6952, 7852, 7632}>
search sum => 45228
  0.468000   0.000000   0.468000 (  0.488028)
=end
