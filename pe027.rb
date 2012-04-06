require 'benchmark'
require 'prime'

def mp(a, b)
  n = 0
  loop do
    break unless ((n + a) * n + b).prime?
    n += 1
  end
  n
end

def top
  m = [0, 0, 0]
  r = -1000..1000
  r.each do |a|
    r.each do |b|
      next unless b.prime?
      n = yield(a, b)
      m = [a, b, n] if m.last < n
    end
  end
  m << m[0] * m[1]
end

Benchmark.bm 10 do |b|
  b.report('n^2+an+b') { p top {|a, b| mp a, b} }
end
