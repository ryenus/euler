require 'benchmark'
require 'prime'

DS = Hash.new{|h,n|h[n] = n*n*2}
RH = Hash.new{|h,n|h[n] = Math.sqrt(n/2).to_i}
P  = Hash.new{|h,n|h[n] = n.prime?}

def search
  res = []
  n = 7#33
  loop do
    n += 2
    next if P[n]
    m = RH[n]
    found = false
    m.downto 1 do |i|
      c = (n - DS[i])
      #p [n, c, i, P[n], R[n/2]]
      found = P[c]
      break if found
    end
    p res << n unless found
  end
  n
end

Benchmark.bm do |b|
  b.report { puts "result => #{search}" }
end

=begin
user     system      total        real
sum => [55385, 31977, 27693, 1533776805]
  0.218000   0.000000   0.218000 (  0.230013)
=end
