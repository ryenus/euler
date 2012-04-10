require 'benchmark'
NUMBERS = (0..9).to_a
P = [7,11,13,17]

class Array
  def mod?(n)
    self.join('').to_i % n == 0
  end
end

class Integer
  def mod?(n)
    self % n == 0
  end
end

def search
  res = []
  NUMBERS.permutation do |na|
    next unless na[0] != 0 and na[3].mod? 2 and na[2,3].reduce(:+).mod? 3 and na[5].mod? 5
    res << na.join('').to_i if na[4,3].mod? 7 and na[5,3].mod? 11 and na[6,3].mod? 13 and na[7,3].mod? 17
  end
  p res
  res.reduce :+
end

Benchmark.bm 15 do |b|
  b.report { puts "sum => #{search}" }
end

=begin
user     system      total        real
search          digits product => 210
  0.000000   0.000000   0.000000 (  0.000000)
=end
