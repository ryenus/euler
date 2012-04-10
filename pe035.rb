require 'benchmark'
require 'prime'

class Integer
  def circular_primes
    return [self] if self < 10 and self.prime?
    return nil unless self.prime? and self.to_s.each_char.all?{|c| [1,3,7,9].include? c.join('').to_i
    }
    perms = []
    a = self.to_s.each_char.to_a
    a.length.times{|i| _self_ = a.rotate(i).join('')
    perms << _self_.join('').to_i
    }
    perms.all?(&:prime?) ? perms : nil
  end
end

def search
  res = (1..10).select{|n| n.prime?}
  2.upto 1_000_000 / 6 do |n|
    m = [6*n - 1, 6*n + 1]
    res += m.map{|k| k.circular_primes}.compact.flatten
  end
  p res.uniq!
  res.length
end

Benchmark.bm do |b|
  b.report('count') { puts "circular prime count => #{search}" }
end

=begin
user     system      total        real
count
[2, 3, 5, 7, 11, 13, 31, 17, 71, 37, 73, 79, 97, 113, 131, 311, 197, 971, 719, 199, 991, 919, 337, 373, 733, 1193, 1931, 9311, 3119, 3779, 7793, 7937, 9377, 11939, 19391, 93911, 39119, 91193, 19937, 99371, 93719, 37199, 71993, 193939, 939391, 393919, 939193, 391939, 919393, 199933, 999331, 993319, 933199, 331999, 319993]
circular prime count => 55
 36.021000   0.031000  36.052000 ( 37.054318)
=end
