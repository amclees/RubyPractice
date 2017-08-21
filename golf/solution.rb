# Ungolfed
states_adjacent = lambda do |code|
  search_string = 'a0k4l5z-c7o3at-d3-f2-g5-h0-i4n5l-k4s7y-l3-m5a8o3i1e4dnst-n4c3dhj5mvy-o5h4r-r2-s2c-t8n4x-v5a3t-w2a4i5v'
  value = 6
  search_string.split('-').each do |segment|
    next unless segment[0] == code[0]
    value = 6
    found = false
    segment.split('').slice(1, segment.length).each do |char|
      if char == '0' || char.to_i != 0
        value = char.to_i
      elsif char == code[1]
        found = true
        break
      end
    end
    value = 6 unless found || segment.length == 2
    break
  end
  value
end

states = ['al', 'ak', 'as', 'az', 'ar', 'ca', 'co', 'ct', 'de', 'dc', 'fm', 'fl', 'ga', 'gu', 'hi', 'id', 'il', 'in', 'ia', 'ks', 'ky', 'la', 'me', 'mh', 'md', 'ma', 'mi', 'mn', 'ms', 'mo', 'mt', 'ne', 'nv', 'nh', 'nj', 'nm', 'ny', 'nc', 'nd', 'mp', 'oh', 'ok', 'or', 'pw', 'pa', 'pr', 'ri', 'sc', 'sd', 'tn', 'tx', 'ut', 'vt', 'vi', 'va', 'wa', 'wv', 'wi', 'wy']

neighbor_number_hash = {}

output = ''
states.each do |state|
  adjacent = states_adjacent.call(state)
  output << state << ' - ' << adjacent.to_s << "\n"
  neighbor_number_hash[adjacent] = [] unless neighbor_number_hash.key?(adjacent)
  neighbor_number_hash[adjacent].push(state)
end

puts output

neighbor_number_hash.keys.sort.reverse.each do |key|
  puts neighbor_number_hash[key].join(', ') + ' -> ' + key.to_s
end

# Golfed
#l = ->s{}
