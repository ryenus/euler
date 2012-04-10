require 'benchmark'
require 'prime'

NUMBERS = (0..9).to_a

class Array
  def to_i
    self.join('').to_i
  end
end

def search(n=4)
  res = []
  NUMBERS.repeated_combination(n) do |ary|
    pr = ary.permutation.select{ |s| s[0].nonzero? and s.to_i.prime? }.uniq
    next if pr.length < 3
    found = false
    pr = pr.map(&:to_i).sort
    pr.combination(2) do |a,b|
      next if a == b
      c = (a+b)/2
      found = pr.include?(c = (a+b)/2)
      (res << [a,b,c].sort) if found
    end
  end
  res.uniq.map(&:to_i)
end

Benchmark.bm do |b|
  b.report { puts "result => #{search}" }
end

=begin
user     system      total        real
 result => [148748178147, 296962999629]
  0.327000   0.000000   0.327000 (  0.339020)
=end

=begin
require 'prime'

Prime.instance.each( 10000-3330*2 ) do |prime|
  next unless prime >= 1000 # needs to be 4 digits
  next if prime == 1487     # skip over this answer
  nums = [prime, prime+3330, prime+3330*2 ]
  next unless nums.all?{ |n| n.prime? }
  digits = nums.map{ |n| n.to_s.split(//).sort }
  next unless digits[0]==digits[1] && digits[1]==digits[2]
  puts nums.join # => 296962999629
  exit
end
=end
