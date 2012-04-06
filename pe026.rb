require 'benchmark'

=begin
10 / 7
.. 30 / 7
.. 20 / 7
.. 60 / 7
.. 40 / 7
.. 50 / 7
.. 10 / 7
=end

HUGE_NUM = 10**2000

def regex(d)
  (HUGE_NUM/d).to_s[/.*?(.+?)(\1)+.*?/,1].length
end

def rep_rem(d)
  a = [0, 1]
  loop do
    r = a.last * 10 % d
    i = a.index(r)
    return (r == 0 ? 0 : a.length - i) unless i.nil?
    a << r
  end
end

def prime_div(d)
  d /= 2 while d % 2 == 0
  d /= 5 while d % 5 == 0
  return 0 if d == 1
  m = 1
  m += 1 until (10**m) % d == 1
  m
end

def top
  m = [0, 0]
  (1...1000).each do |i|
    r = yield i
    m = [i, r] if m[1] < r
  end
  m
end

Benchmark.bm 10 do |b|
  b.report('warm-up')   { p top {|n| regex n} }
  b.report('regex')     { p top {|n| regex n} }
  b.report('rep_rem')   { p top {|n| rep_rem n} }
  b.report('prime_div') { p top {|n| prime_div n} }
end
