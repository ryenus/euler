#~ A = (3..20)

#~ def ok?(n)
  #~ A.each do |x|
    #~ return false if n % x != 0
  #~ end
  #~ true
#~ end

#~ t = s = [2, 3, 5, 7, 11, 13, 17, 19].inject(:*)

#~ loop do
  #~ t += s
  #~ break if ok?(t)
#~ end

t = (11..20).inject(1) { |r, n| r.lcm n }

puts t
