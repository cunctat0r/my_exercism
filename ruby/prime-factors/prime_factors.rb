#
class PrimeFactors
  def self.for(num)
    prime_factors = []
    factor = 2
    while num > 1
      while num % factor == 0
        prime_factors << factor
        num /= factor
      end
      factor += 1
    end
    prime_factors << num if num > 1
    prime_factors
  end
end
