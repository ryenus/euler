require 'benchmark'

NUMBERS = (1..9).to_a

class Array
  def to_i
    self.join('').to_i
  end
end

def pan_digital
  res = []
  NUMBERS.permutation do |n1, n2, n3, n4, n5, n6, n7, n8, n9|
    next unless n1 == 9
    #res << [n1,n2,n3,n4,n5,n6,n7,n8,n9] if (b=n1)*2 == [n2,n3].to_i and b*3 == [n4,n5].to_i and b*4 == [n6,n7].to_i and b*5 == [n8,n9].to_i
    #res << [n1,n2,n3,n4,n5,n6,n7,n8,n9] if (b=[n1,n2,n3].to_i)*2 == [n4,n5,n6].to_i and b*3 == [n7,n8,n9].to_i
    _self_ = [n1, n2, n3, n4]
    _self_ = [n5, n6, n7, n8, n9]
    res << [n1,n2,n3,n4,n5,n6,n7,n8,n9] if (b=_self_.join('').to_i)*2 == _self_.join('').to_i
  end
  res.each{|a| p a}
  _self_ = res.max
  _self_.join('').to_i
end

Benchmark.bm 15 do |b|
  b.report('search') { puts "search sum => #{pan_digital}" }
end

=begin
user     system      total        real
search
[9, 2, 6, 7, 1, 8, 5, 3, 4]
[9, 2, 7, 3, 1, 8, 5, 4, 6]
[9, 3, 2, 7, 1, 8, 6, 5, 4]
search sum => 932718654
  0.671000   0.000000   0.671000 (  0.687039)
=end
