adjacency_map = {
  'ak' => [],
  'al' => ['ms', 'tn', 'ga', 'fl'],
  'ar' => ['mo', 'tn', 'ms', 'la', 'tx', 'ok'],
  'az' => ['ca', 'nv', 'ut', 'co', 'nm'],
  'ca' => ['or', 'nv', 'az'],
  'co' => ['wy', 'ne', 'ks', 'ok', 'nm', 'az', 'ut'],
  'ct' => ['ny', 'ma', 'ri'],
  'de' => ['md', 'pa', 'nj'],
  'fl' => ['al', 'ga'],
  'ga' => ['fl', 'al', 'tn', 'nc', 'sc'],
  'hi' => [],
  'ia' => ['mn', 'wi', 'il', 'mo', 'ne', 'sd'],
  'id' => ['mt', 'wy', 'ut', 'nv', 'or', 'wa'],
  'il' => ['in', 'ky', 'mo', 'ia', 'wi'],
  'in' => ['mi', 'oh', 'ky', 'il'],
  'ks' => ['ne', 'mo', 'ok', 'co'],
  'ky' => ['in', 'oh', 'wv', 'va', 'tn', 'mo', 'il'],
  'la' => ['tx', 'ar', 'ms'],
  'ma' => ['ri', 'ct', 'ny', 'nh', 'vt'],
  'md' => ['va', 'wv', 'pa', 'de'],
  'me' => ['nh'],
  'mi' => ['wi', 'in', 'oh'],
  'mn' => ['wi', 'ia', 'sd', 'nd'],
  'mo' => ['ia', 'il', 'ky', 'tn', 'ar', 'ok', 'ks', 'ne'],
  'ms' => ['la', 'ar', 'tn', 'al'],
  'mt' => ['nd', 'sd', 'wy', 'id'],
  'nc' => ['va', 'tn', 'ga', 'sc'],
  'nd' => ['mn', 'sd', 'mt'],
  'ne' => ['sd', 'ia', 'mo', 'ks', 'co', 'wy'],
  'nh' => ['vt', 'me', 'ma'],
  'nj' => ['de', 'pa', 'ny'],
  'nm' => ['az', 'ut', 'co', 'ok', 'tx'],
  'nv' => ['id', 'ut', 'az', 'ca', 'or'],
  'ny' => ['nj', 'pa', 'vt', 'ma', 'ct'],
  'oh' => ['pa', 'wv', 'ky', 'in', 'mi'],
  'ok' => ['ks', 'mo', 'ar', 'tx', 'nm', 'co'],
  'or' => ['ca', 'nv', 'id', 'wa'],
  'pa' => ['ny', 'nj', 'de', 'md', 'wv', 'oh'],
  'ri' => ['ct', 'ma'],
  'sc' => ['ga', 'nc'],
  'sd' => ['nd', 'mn', 'ia', 'ne', 'wy', 'mt'],
  'tn' => ['ky', 'va', 'nc', 'ga', 'al', 'ms', 'ar', 'mo'],
  'tx' => ['nm', 'ok', 'ar', 'la'],
  'ut' => ['id', 'wy', 'co', 'nm', 'az', 'nv'],
  'va' => ['nc', 'tn', 'ky', 'wv', 'md'],
  'vt' => ['ny', 'nh', 'ma'],
  'wa' => ['id', 'or'],
  'wi' => ['mi', 'mn', 'ia', 'il'],
  'wv' => ['oh', 'pa', 'md', 'va', 'ky'],
  'wy' => ['mt', 'sd', 'ne', 'co', 'ut', 'id']
}

letter_steps = {}

adjacency_map.each do |state, adjacent|
  letter_steps[state[0]] = {} unless letter_steps.key?(state[0])
  letter_steps[state[0]][state[1]] = adjacent.size
end

search_string = ''
letter_steps.each do |first_letter, second_hash|
  next if (second_hash.keys.size == 1 && second_hash.values[0] == 6) || !second_hash.values.inject(false) do |has_non_six, value|
    has_non_six || value != 6
  end
  search_string << first_letter
  if second_hash.keys.size == 1
    search_string << second_hash.values[0].to_s
  else
    buckets = {}
    second_hash.each do |second_letter, adjacent_count|
      buckets[adjacent_count] = [] unless buckets.key?(adjacent_count)
      buckets[adjacent_count].push(second_letter)
    end
    buckets.keys.sort_by { |key| buckets[key].size }.each_with_index do |value, index|
      next if value == 6
      search_string << value.to_s
      search_string << buckets[value].join('')# unless index == buckets.size - 1
    end
  end
  search_string << '-'
end

puts search_string
