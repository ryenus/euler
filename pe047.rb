require 'benchmark'
require 'prime'

DS = Hash.new{|h,n|h[n] = n*n*2}
RH = Hash.new{|h,n|h[n] = Math.sqrt(n/2).to_i}
P  = Hash.new{|h,n|h[n] = n.prime?}

def search(t)
  n = 1#647
  c = 0
  loop do
    c = (n.prime_division.size == t) ? c + 1 : 0
    break if c == t
    n += 1
  end
  n - t + 1
end

Benchmark.bm do |b|
  b.report { puts "result => #{search 4}" }
end

=begin
user     system      total        real
 result => 134043
  6.942000   0.000000   6.942000 (  7.441425)
=end
