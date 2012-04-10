require 'benchmark'
require 'prime'

# 1 + 2**2 + 3**3 + 4**4 + 5**5 + 6**6

LIMIT = 10**10

def search(n)
  1.upto(n).reduce(0) do |s, i|
    (s % LIMIT) + ((i**i) % LIMIT)
  end
end

Benchmark.bm do |b|
  b.report { puts "result => #{search 1000}" }
end

=begin
user     system      total        real
sum => [55385, 31977, 27693, 1533776805]
  0.218000   0.000000   0.218000 (  0.230013)
=end
