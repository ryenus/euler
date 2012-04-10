require 'benchmark'

# n = (r(24p + 1) + 1) / 6
H = Hash.new {|h,n| h[n] = n*(3*n - 1)/2}

class Integer
  def rp
    n = ((Math.sqrt(24*self + 1).to_i + 1) / 6).to_i
    H[n] == self ? n : nil
  end
end

def search
  res = [0,0,10**1024]
  k = 1#2166
  loop do
    k += 1
    pk = H[k]
    (k-1).downto 1 do |j|
      pj = H[j]
      d = pk - pj
      next if d.rp.nil?
      s = pk + pj
      next if s.rp.nil?
      p res = [j, k, d] if d < res[2]
    end
    break if k == 2167
  end
end

Benchmark.bm 15 do |b|
  b.report { puts "sum => #{search}" }
end

=begin
user     system      total        real
search          digits product => 210
  0.000000   0.000000   0.000000 (  0.000000)
=end
