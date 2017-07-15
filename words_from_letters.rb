# frozen_string_literal: false

require 'json'

json = nil
File.open('eng_map.min.json', 'r') do |file|
  file.each_line do |line|
    json = '' unless json
    json = line
  end
end

map = JSON.parse(json)

puts 'Enter some letters:'
input = gets.chomp.downcase.chars.uniq.sort.join('')

puts 'Made using all letters:'
if map.key?(input)
  puts map[input].each_with_index.map { |word, index| "#{index + 1}. #{word}" }.join("\n")
else
  puts 'No matching word'
end

puts 'Made using all or some letters:'
words = []
combinations = []
(1..input.length).each do |combination_size|
  input.chars.combination(combination_size).each do |combination|
    joined = combination.join('')
    words.push(*map[joined]) if map.key?(joined)
  end
end

puts words.sort_by(&:length).reverse.each_with_index.map { |word, index| "#{index + 1}. #{word}" }.join("\n")
