# frozen_string_literal: false

require 'json'

json = nil
File.open('eng.min.json', 'r') do |file|
  file.each_line do |line|
    json = '' unless json
    json = line
  end
end

words = JSON.parse(json)

map = {}

words.each do |word|
  sorted = word.chars.sort.join('')
  map[sorted] = [] unless map.key?(sorted)
  map[sorted].push(word)
end

map_json = map.to_json

file = File.new('eng_map.min.json', 'w')
file.syswrite(map_json)
file.close
