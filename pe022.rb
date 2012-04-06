#class String
#
#  BASE_ORD = 'A'.ord - 1
#
#  def score
#    self.split('').inject(0) do |s, c|
#      s + c.upcase.ord - BASE_ORD
#    end
#  end
#end

#puts 'z'.score


#File.open('names.txt') do |f|
#  #f.readlines(',').each do |s|
#  #  p s
#  #end
#  s = f.read.split(/(",)?"/).reject {|n| n == '",' or n.empty? }.sort.each_with_index.reduce(0) do |s, (n, i)|
#    s + n.score * (i + 1)
#  end
#
#  puts s
#end

#File.open 'names.txt' do |f|
#  f.read.split(/"(,")?/).reject{|s| s == ',"' or s.empty?}.sort.each do |n|
#    puts n
#  end
#end

names=eval("[#{File.read('names.txt')}]").sort
puts names.each_with_index.map { |n, i| n.each_byte.map { |c| (c-64)*i.next }.inject(:+) }.inject(:+)