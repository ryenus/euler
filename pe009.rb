# a**2 + b**2 = c**2
# a + b + c = 1000
# (a + b + c)**2 = 1000_000 = (a + b + c)*(a + b + c)
# = aa + ab + ac + ab + bb + bc + ac + bc + cc
# = aa + bb + cc + 2ab + 2ac + 2bc
# = 2cc + 2ab + 2c(a+b)
# = 2ab + 2c(a+b+c)
# => 2ab + 2000c = 1000_000
# => ab + 1000c = 500_000

# (2ab + 2000c) * (a + b + c) = 1_000_000_000
# (ab + 1000c) * (a + b + c) = 500_000_000
# aab + 1000ac + abb + 1000bc + abc + 1000cc = 500_000_000
# aab + abb + abc + 1000ac + 1000bc + 1000aa + 1000bb = 500_000_000
# 1000(aa + bb + ac + bc) + ab(a + b) + abc = 500_000_000
# 1000c(a + b + c) + ab(1000 - c) + abc = 500_000_000
# 1_000_000c + 1000ab - abc + abc = 500_000_000
# 1000


1.upto 998 do |a|
  1.upto a do |b|
    c = 1000 - a - b
    if a*a + b*b == c*c
      puts "#{a} * #{b} * #{c} => #{a * b * c}"
      break
    end
  end
end
