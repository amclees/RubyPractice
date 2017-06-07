# frozen_string_literal: true

# Generates a password from an 80k word English dictionary with a random number of random words.

require 'json'
require 'securerandom'

def secure_int(modulus)
  SecureRandom.hex.to_i(16) % modulus
end

json = nil
File.open('eng.min.json', 'r') do |file|
  file.each_line do |line|
    json = '' unless json
    json = line
  end
end

words = JSON.parse(json)

puts 'Password base length:'
base = gets.chomp.to_i
puts 'Additional words allowed:'
additional = gets.chomp.to_i

# The total number of possible passwords is the sum of each length's possible passwords.
# Each length has dictionary_size**number_of_words possibilities.
possible_passwords = ([words.length] * (additional + 1)).map.with_index { |element, index| element**(base + index) }.inject(:+)

bit_strength = Math.log(possible_passwords, 2)

password_length = base + secure_int(additional)

password = ''
password_length.times do
  password << words[secure_int(words.length)] + ' '
end

puts password
puts "Words from #{words.length} word dictionary."
puts "Used method has a strength of #{bit_strength}."
