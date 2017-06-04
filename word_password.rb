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

password_length = 4 + secure_int(2)

password = ''
password_length.times do
  password << words[secure_int(words.length)] + ' '
end

puts password
