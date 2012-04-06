STDOUT::sync = true

def trinum(n)
  1.upto(n).inject :+
end

#~ puts trinum 7
x = 100000000

def cft(t)
  return 1 if t == 1

  m = t
  r = Math.sqrt(m).to_i

  a = []

  1.upto r do |i|
    a << i if m % i == 0
  end

  c = a.size * 2
  c += 1 if r**2 == m

  c
end

def cftn(n)
  cft trinum n
end

max = 1
n = 1
loop do
  n += 1
  t = trinum n
  c = cft t

  max = c if max < c
  (puts "#{n} => #{t} => #{c}"; break) if max > 500
end



#~ puts trinum 224
