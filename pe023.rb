require "set"
require "benchmark"

class Integer
  def abundant?
    case self
      when 1;
        [1]
      else
        a = [1]
        2.upto Math.sqrt(self).to_i do |n|
          q, r = self.divmod n
          next unless r == 0
          a << n
          a << q unless q == n
          #a |= [q, n] if r == 0
        end
        a
    end.reduce(:+) > self
  end
end

m = 28123

ab_num = 12.upto(m).select(&:abundant?)

def sb(m, ab_num)
  su = (1+m) * m / 2
  st = Set.new
  sca = ab_num.repeated_combination(2).reduce(0) do |s,(a,b)|
    t = a + b
    s + unless st.include? t or t > m
      st << t
      t
    else
      0
    end
  end
  p "#{su} - #{sca}"
  su - sca # => 4179871
end

def mk(m, ab_num)
  ma = Array.new(m, false)
  ab_num.each do |a|
    ab_num.each do |b|
      ma[a+b] = true unless a+b > m
    end
  end

  sn = 0
  1.upto m do |i|
    sn += i unless ma[i]
  end

  sn
end

Benchmark.bm do |b|
    b.report('sb') do p sb(m, ab_num) end # => 4179871
    b.report('mk') do p mk(m, ab_num) end # => 4179871
end

