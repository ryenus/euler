require 'benchmark'

NUMBERS = (1..9).to_a

def curious_fraction
  fractions = []
  NUMBERS.permutation 2 do |a, b|
    next unless a < b
    NUMBERS.each do |c|
      ra = Rational(a*10 + c, c*10 + b)
      rb = Rational(a + 10*c, c + b*10)
      rc = Rational(a, b)
      (p [0,a,b,c]; fractions << ra) if ra == rc
      (p [1,a,b,c]; fractions << rb) if rb == rc
    end
  end
  p fractions
  fractions.reduce(:*).denominator
end

Benchmark.bm 15 do |b|
  b.report('curious_fraction') { puts "curious_fraction lcd => #{curious_fraction}" }
end

=begin
user     system      total        real
curious_fraction
[0, 1, 4, 6]
[0, 1, 5, 9]
[0, 2, 5, 6]
[0, 4, 8, 9]
[(1/4), (1/5), (2/5), (1/2)]
curious_fraction lcd => 100
  0.000000   0.000000   0.000000 (  0.001000)
=end
