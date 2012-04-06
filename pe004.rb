require 'benchmark'

class String
  def reverse
    self.split(//).reverse.join
  end

  def palindrome?
    self.reverse == self
  end
end

a = b = c = 0
#~ m = n = o = 0

999.downto 100 do |x|
  999.downto x do |y|
    z = x * y
    #~ m += 1
    if z > c
      #~ n += 1
      if z.to_s.palindrome?
        a, b, c = x, y, z
        #~ o += 1
        #~ puts x, y, z
        break
      end
    end
  end
end

puts "#{c} = #{a} * #{b}"
#~ puts "#[#{m}, #{n}, #{o}]"
