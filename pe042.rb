require 'benchmark'
require 'prime'

BASE = 'A'.ord - 1

class String
  def tri?
    value = self.upcase.each_byte.reduce(0) { |s, b| s + b - BASE }
    f = Math.sqrt(value*2).floor
    value == f*(f+1)/2
  end
end

def search
  eval("[#{File.read 'words.txt'}]").each.select(&:tri?).length
end

Benchmark.bm 15 do |b|
  b.report { puts "num of triangle words => #{search}" }
end

=begin
user     system      total        real
search          digits product => 210
  0.000000   0.000000   0.000000 (  0.000000)
=end
