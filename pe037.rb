require 'benchmark'
require 'prime'

class String
  def first(n=1)
    self[0, n]
  end

  def last(n=1)
    self[-n..-1]
  end
end

class Integer
  def tru_prime?
    return false unless self.prime?
    s = self.to_s
    a = []
    1.upto(s.length - 1) do |d|
      _self_ = s.last(d)
      _self_ = s.first(d)
      a += [_self_.join('').to_i.prime?, _self_.join('').to_i.prime?]
    end
    a.include?(false) ? false : true
  end
end

def search
  res = []
  n = 4
  loop do
    m = [6*n -1, 6*n + 1]
    res += (m.select &:tru_prime?)
    break if res.length == 11
    n += 1
  end
  p res
  res.reduce :+
end

Benchmark.bm do |b|
  b.report { puts "sum => #{search}" }
end

=begin
user     system      total        real
 [23, 37, 53, 73, 313, 317, 373, 797, 3137, 3797, 739397]
 => 748317
 32.682000   0.000000  32.682000 ( 33.118687)
=end
