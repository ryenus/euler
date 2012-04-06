require 'benchmark'

def accepted?(n, e)
  n.to_s.split('').reduce(0) {|s, d| s + d.to_i**e} == n
end

def max_digits(e)
  n = (9**e).to_s.length
  loop do
    break if 9**e * n < 10**n
    n += 1
  end
  n
end

def search(e)
  a = []
  limit = 9**e * max_digits(e)
  2.upto limit do |n|
    (a << n; print "#{n} ") if accepted? n, e
  end
  a.reduce :+
end

Benchmark.bm 10 do |b|
  b.report('search') { puts "sum => #{search 5}" }
  b.report('search') { puts "sum => #{search 6}" }
  b.report('search') { puts "sum => #{search 7}" }
end

=begin
user     system      total        real
search 5   4150 4151 54748 92727 93084 194979 sum => 443839
5.335000   0.000000   5.335000 (  5.652323)

search 6   548834 sum => 548834
 58.235000   0.000000  58.235000 ( 58.669131)

search 7   1741725 4210818 9800817 9926315 14459929 sum => 40139604
886.476000   0.078000 886.554000 (892.570051)
=end
