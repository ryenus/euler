require 'benchmark'
require 'set'

def count(m, n)
  s = Set.new
  m.upto n do |a|
    m.upto n do |b|
      s << a**b
    end
  end
  s.size
end

Benchmark.bm 10 do |b|
  b.report('count') { p count 2, 100 }
end
