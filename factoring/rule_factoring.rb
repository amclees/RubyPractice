# frozen_string_literal: false

require 'prime'

# Might be faster by using a logarithm recusively to get each digit and subtracting the digit from the number
def get_digits(number)
  number.to_s.split('').map(&:to_i)
end

def fallback_factor(n)
  Prime.each(n) do |num|
    break if n <= 1
    return num if (n % num).zero?
  end
end

def factor_from_rules(composite)
  digits = get_digits(composite)
  reverse = digits.reverse

  # These eliminate numbers ending in 0, 2, 4, 5, 6, 8.
  return 2 if (composite % 2).zero?
  return 5 if (composite % 5).zero?

  # Elimination rules go here

  fallback_factor(composite)
end

def factor(composite)
  return [] if composite < 2
  factors = []

  factor = factor_from_rules(composite)
  quotient = composite / factor
  factors.push(factor)
  factors.push(factor(quotient))

  factors
end

puts factor 25947401
