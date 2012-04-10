require 'benchmark'

class Integer
  def factorial
    return 1 if self == 0 || self == 1
    @factorial ||= (2..self).reduce :*
  end

  def factorion?
    self == self.to_s.each_char.reduce(0){|r, d| r + d.join('').to_i.factorial}
  end
end

def factorions
  a = []
  11.upto 1_999_999 do |n|
    a << n if n.factorion?
  end
  p a
  a.reduce :+
end

Benchmark.bm do |b|
  b.report('factorions') { puts "factorions sum => #{factorions}" }
end

=begin
user     system      total        real
factorions[145, 40585]
factorions sum => 40730
 18.533000   0.000000  18.533000 ( 18.914082)
=end
