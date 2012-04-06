class Integer
  def divisors
    case self
      when 1; [1]
      else
        a = [1]
        2.upto Math.sqrt(self).to_i do |n|
          q, r = self.divmod n
          next unless r == 0
          a << n
          a << q unless q == n
        end
        a
    end
  end

  def div_sum
    @div_sum ||= divisors.reduce(:+)
  end

  def amicable?
    @amicable ||= (@div_sum ||= divisors.reduce(:+)) == self and div_sum != self
  end
end

#p 220.amicable
amicables = (1...10_000).select(&:amicable?)
p amicables.reduce(:+)
