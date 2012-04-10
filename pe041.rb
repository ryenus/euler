require 'benchmark'
require 'prime'

NUMBERS = (1..9).to_a

def search
  max = 0
  [7, 4, 1].each do |l|
    NUMBERS[0,l].reverse.permutation do |na|
      next unless na[-1].odd?
      _self_ = na.join('')
      num = _self_.join('').to_i
      max = num if max < num and num.prime?
    end
  end
  max
end

Benchmark.bm 15 do |b|
  b.report('search') { puts "largest pandigital prime => #{search}" }
end

=begin
user     system      total        real
search          digits product => 210
  0.000000   0.000000   0.000000 (  0.000000)
=end
