
require 'benchmark'

#~ class Integer
  #~ def to_t
    #~ case self
      #~ when 0; 'zero'
      #~ when 1; 'one'
      #~ when 2; 'two'
      #~ when 3; 'three'
      #~ when 4; 'four'
      #~ when 5; 'five'
      #~ when 6; 'six'
      #~ when 7; 'seven'
      #~ when 8; 'eight'
      #~ when 9; 'nine'
      #~ when 10; 'ten'
      #~ when 11; 'eleven'
      #~ when 12; 'twelve'
      #~ when 13; 'thirteen'
      #~ when 14; 'fourteen'
      #~ when 15; 'fifteen'
      #~ when 16; 'sixteen'
      #~ when 17; 'seventeen'
      #~ when 18; 'eighteen'
      #~ when 19; 'nineteen'
      #~ when 20; 'twenty'
      #~ when 30; 'thirty'
      #~ when 40; 'fourty'
      #~ when 50; 'fifty'
      #~ when 60; 'sixty'
      #~ when 70; 'seventy'
      #~ when 80; 'eighty'
      #~ when 90; 'ninety'
      #~ when 21..99
        #~ (self/10*10).to_t + (self%10).to_t
      #~ when 100..999
        #~ (self/100).to_t + 'hundred' + (self%100 == 0 ? '' : 'and' + (self%100).to_t)
      #~ when 1_000.999_999
        #~ (self/1000).to_t + 'thousand' + (self%1000).to_t
    #~ end

  #~ end
#~ end

s = Hash.new do |h, k|
  h[k] = case k
    when 0; ''
    when 1; 'one'
    when 2; 'two'
    when 3; 'three'
    when 4; 'four'
    when 5; 'five'
    when 6; 'six'
    when 7; 'seven'
    when 8; 'eight'
    when 9; 'nine'
    when 10; 'ten'
    when 11; 'eleven'
    when 12; 'twelve'
    when 13; 'thirteen'
    when 14; 'fourteen'
    when 15; 'fifteen'
    when 16; 'sixteen'
    when 17; 'seventeen'
    when 18; 'eighteen'
    when 19; 'nineteen'
    when 20; 'twenty'
    when 30; 'thirty'
    when 40; 'forty'
    when 50; 'fifty'
    when 60; 'sixty'
    when 70; 'seventy'
    when 80; 'eighty'
    when 90; 'ninety'
    when 21..99
      h[k/10*10] + h[k%10]
    when 100..999
      h[k/100] + 'hundred' + (k%100 == 0 ? '' : 'and' + h[k%100])
    when 1_000..999_999
      h[k/1000] + 'thousand' + h[k%1000]
    end
end

t = Hash.new do |h,k|
  h[k] = case k
    when 0..20;  s[k].length
    when 30, 40, 50, 60, 70, 80, 90
      s[k].length
    when 21..99
      h[k/10*10] + h[k%10]
    when 100..999
      h[k/100] + 7 + (k%100 == 0 ? 0 : 3 + h[k%100])
    when 1_000..999_999
      h[k/1000] + 8 + h[k%1000]
    end
end

#~ n = 1000
n = 999_999
r = 0

Benchmark.bm do |b|
  b.report { r = 1.upto(n).inject(0){|s,i| s+t[i]} } # => 21124
end

#~ puts t, s
puts r
