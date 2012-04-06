#~ m
#~ 2m => m
#~ 2m + 1 => 3 * (2m + 1) + 1 => 6m + 4 => 3m + 2


#~ m.odd?
  #~ 3m + 1 =>
  #~ 3(3m + 2) + 1 => 9m + 7

#~ m.even?
 #~ m / 2
 #~ 3m/2 + 1

STDOUT::sync = true

def f(n)
  n.even? ? n / 2 : 3 * n + 1
end

def chain_size(n)
  s = 1
  m = n
  loop do
    #~ puts m
    break if m == 1
    s += 1
    m = f(m)
  end
  s
end

puts chain_size(1_000_000)

max = 1

999_999.downto 1 do |n|
  s = chain_size n
  if max < s
    max = s
    puts "#{n} => #{max}"
  end
end

