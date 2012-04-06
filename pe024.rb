require 'benchmark'

def f(n)
  n == 0 ? 1 : (1..n).reduce(:*)
end

=begin
We know that there are n! permutations for n distinct digits and,
as we're working in lexicographical order, after 9! permutations
the ten digit string will have become: 0987654321. The 9!+1
permutation will be 1023456789, the 2*9!+1=725761 permutation
will be 2013456789. However, the 3*9!+1 permutation (3012456789)
will be greater than one million. So we now consider the
permutations of the last nine digits, 013456789: 6*8!+1 will
take it to 701345689. We have now computed 967681 permutations
and arrived at the number 2701345689. Then we look at the last
eight digits, and work out that a further 6*7!+1 takes it to
the string 2780134569 and a total of 997921 permutations...
=end
def np(a, n)
  a, r = [*a], []
  (a.length - 1).downto 0 do |i|
    q, n = n.divmod f(i)
    r << a.delete_at(q)
  end
  r.join ''
end

Benchmark.bm do |b|
  #b.report { puts (0..9).to_a.permutation(10).to_a[1_000_000-1].join('') }
  b.report { puts np (0..9).to_a, 1_000_000 -1 }
end
