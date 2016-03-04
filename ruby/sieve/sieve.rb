# Sieve
class Sieve
  def initialize(initial)
    @initial = initial
  end

  def primes
    init_sieve = (2..@initial).to_a
    init_sieve.each do |element|
      init_sieve.delete_if do |number|
        (number % element == 0) && (number != element)
      end
    end
  end
end
