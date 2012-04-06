require 'benchmark'

Benchmark.bm do |b|
  b.report {
    a, b, c = 1, 1, 2
    while b.to_s.length < 1000
      a, b, c = b, a + b, c + 1
    end
    puts c#, b
  }
end
