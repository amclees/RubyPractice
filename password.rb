# frozen_string_literal: false

require 'securerandom'

puts 'Enter length:'
length = gets.chomp.to_i

puts 'How many to output?'
n = gets.chomp.to_i

puts 'Put to file? (y/n)'
to_file = gets.chomp == 'y'

if to_file
  filename = 'passwords_' + SecureRandom.uuid
  file = File.new(filename, 'w')
end

n.times do
  pass = ''
  length.times do
    pass += ((SecureRandom.hex.to_i(16) % 94) + 32).chr
  end
  puts pass unless to_file
  file.syswrite(pass + "\n") if to_file
end

file.close if to_file
