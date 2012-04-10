require 'benchmark'

class Integer
  def acc_length
    e = 1
    e += 1 until self < 10**e
    self * self.to_s.length - (1..(e-1)).reduce(0){|s, n| s + 10**n - 1}
  end
end

def num_at(pos)
  upper_bound = e = 1
  apos = pos
  loop do
    upper_bound = 10**e - 1
    break if apos <= upper_bound.acc_length
    apos += upper_bound
    e += 1
  end
  ceil, mod = apos.divmod upper_bound.to_s.length
  _self_ = (mod == 0 ? ceil.to_s[-1] : (ceil + 1).to_s[mod - 1])
  _self_.join('').to_i
end

def search
  11.times.map{|n|num_at 10**n}.reduce(:*)
end

Benchmark.bm 15 do |b|
  b.report('search') { puts "digits product => #{search}" }
end

=begin
user     system      total        real
search          digits product => 210
  0.000000   0.000000   0.000000 (  0.000000)
=end
