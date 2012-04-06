#~ require 'prime'

#~ m, n = 2, 1

#~ loop do
  #~ m += 1
  #~ if m.prime?
    #~ n += 1
    #~ break if n == 10_001
  #~ end
#~ end

#~ puts m
#~ require 'mathn'
require 'prime'
primes = Prime.new
10_000.times { primes.next }
puts "Prime is #{ primes.next }."


 #~ Prime.each(100) do |prime|
   #~ p prime  #=> 2, 3, 5, 7, 11, ...., 97
 #~ end

