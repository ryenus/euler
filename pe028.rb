require 'benchmark'

=begin
r: g; c0 c1 c2 c3
1: 2;  3  5  7  9
2: 4; 13 17 21 25
3: 6; 31 37 42 48
4: 8; 56 64 72 80
n:2n;
=end

def sum(n)
  a = Array.new((n - 1) / 2 + 1)
  a.length.times do |i|
    a[i] = case i
      when 0;
        [1]
      else
        l = a[i - 1].last
        g = i * 2
        [l + g, l + g * 2, l + g * 3, l + g * 4]
    end
  end

  a.reduce(0) do |r, b|
    r + b.reduce(:+)
  end
end

Benchmark.bm 10 do |b|
  b.report('count') { p sum 1001 }
end
