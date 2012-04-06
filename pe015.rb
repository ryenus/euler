
x = y = 20

fa = Hash.new do |h, k|
  h[k] = k == 1 ? 1 : k * h[k - 1]
end

#~ puts fa[x + y] / (fa[x] * fa[y])

fi = Hash.new do |h, k|
  h[k] = k < 3 ? 1 : h[k - 1] + h[k - 2]
end

#~ puts fi[5]


1.upto 20 do |n|
  puts "#{n} => #{fa[n * 2] / fa[n] / fa[n]}"
end

1.upto 40 do |n|
  puts "#{n} => #{fi[n]}"
end
