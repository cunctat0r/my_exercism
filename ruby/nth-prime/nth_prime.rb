class Prime
  def self.nth(n)
    raise ArgumentError if n == 0

    primes_counter = 0
    number = 2
    while true      
      primes_counter += 1 if prime?(number)      
      return number if primes_counter == n      
      number += 1
    end

  end

private
  def prime?(number)
    2.upto(number - 1) do |num|
      return false if number % num == 0
    end
    true
  end

end