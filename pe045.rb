require 'benchmark'

# n = ((8t + 1).r - 1)/2
T = Hash.new {|h,n| h[n] = n*(n+1)/2}
# n = ((24p + 1).r + 1) / 6
P = Hash.new {|h,n| h[n] = n*(3*n - 1)/2}
# n = ((8h + 1).r + 1)/4
H = Hash.new {|h,n| h[n] = n*(2*n - 1)}

class Integer
  def r
    Math.sqrt(self).to_i
  end
  def rt
    n = (((8*self + 1).r - 1)/2).to_i
    T[n] == self ? n : nil
  end
  def rp
    n = (((24*self + 1).r + 1) / 6).to_i
    P[n] == self ? n : nil
  end
  def rh
    n = (((8*self + 1).r + 1) / 4).to_i
    H[n] == self ? n : nil
  end
end

def search
  res = [0,0,0]
  l = 143
  loop do
    l += 1
    target = H[l]
    k = target.rp
    next if k.nil?
    j = target.rt
    next if j.nil?
    res = [j,k,l,target]
    break
  end
  res
end

Benchmark.bm 15 do |b|
  b.report { puts "sum => #{search}" }
end

=begin
user     system      total        real
sum => [55385, 31977, 27693, 1533776805]
  0.218000   0.000000   0.218000 (  0.230013)
=end
