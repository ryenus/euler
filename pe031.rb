require 'benchmark'

COINS = [1, 2, 5, 10, 20, 50, 100, 200]

def fail_fast(target)
  m = COINS.reverse
  r = m.map {|e| target / e}
  count = 0
  r[0].downto 0 do |a|
    ma = m[0]*a; (count += 1 if ma == target; next) unless ma < target
    r[1].downto 0 do |b|
      mb = ma + m[1]*b; (count += 1 if mb == target; next) unless mb < target
      r[2].downto 0 do |c|
        mc = mb + m[2]*c; (count += 1 if mc == target; next) unless mc < target
        r[3].downto 0 do |d|
          md = mc + m[3]*d; (count += 1 if md == target; next) unless md < target
          r[4].downto 0 do |e|
            me = md + m[4]*e; (count += 1 if me == target; next) unless me < target
            r[5].downto 0 do |f|
              mf = me + m[5]*f; (count += 1 if mf == target; next) unless mf < target
              r[6].downto 0 do |g|
                count += 1 if (m[0]*a + m[1]*b + m[2]*c + m[3]*d + m[4]*e + m[5]*f + m[6]*g) <= target
              end
            end
          end
        end
      end
    end
  end
  count
end


def dyna_pro(target)
  poss = Array.new(target + 1) {|i| i == 0 ? 1 : 0}
  COINS.each do |c|
    c.upto target do |t|
      poss[t] += poss[t - c]
    end
  end
  poss[target]
end


def recur(target, max = 0)
  return 1 if max == 7
  sum = 0
  max.upto COINS.length - 1 do |i|
    gap = target - COINS[i]
    sum += 1 if gap == 0
    sum += recur gap, i if gap > 0
  end
  sum
end


Benchmark.bm 15 do |b|
  b.report('fail_fast 200') { puts "num of combinations => #{fail_fast 200}" }
  b.report('dyna_pro 200') { puts "num of combinations => #{dyna_pro 200}" }
  b.report('recur 200') { puts "num of combinations => #{recur 200}" }
end

=begin
user     system      total        real
fail_fast 200   num of combinations => 73682
  0.234000   0.000000   0.234000 (  0.238014)
dyna_pro 200    num of combinations => 73682
  0.016000   0.000000   0.016000 (  0.001000)
recur 200       num of combinations => 73682
  3.416000   0.000000   3.416000 (  3.550203)
=end
