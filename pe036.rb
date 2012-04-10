require 'benchmark'

class String
  def reverse
    self.split(//).reverse.join
  end

  def palindrome?
    self.reverse == self
  end
end

def double_palindromes
  res = []
  n = 1
  while n < 1_000_000
    res << n if n.to_s.palindrome? and n.to_s(2).palindrome?
    n += 2
  end
  p res
  res.reduce :+
end

Benchmark.bm do |b|
  b.report('sum') { puts " => #{double_palindromes}" }
end

=begin
user     system      total        real
sum
[1, 3, 5, 7, 9, 33, 99, 313, 585, 717, 7447, 9009, 15351, 32223, 39993, 53235, 53835, 73737, 585585]
 => 872187
  6.599000   0.016000   6.615000 (  6.712380)
=end
