require 'benchmark'
require 'set'

def search
  max = [0,[]]
  1000.downto 10 do |pm|
    s = Set.new
    1.upto pm/3.4 do |a|
      ((pm-a)/2).downto 1 do |b|
        c = pm - a - b
        break unless a + b > c
        s << [a, b, c].sort if a**2 + b**2 == c**2
      end
    end

    max = [pm, s] if s.length > max[1].length
  end

  max
end

Benchmark.bm 15 do |b|
  b.report('search') { puts "search sum => #{search}" }
end

=begin
user     system      total        real
=end
