require 'prime'

puts Prime.each(2_000_000).inject(:+)
#~ puts Prime.each(10).inject(:+)
