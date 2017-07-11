# frozen_string_literal: false

module WordRegistry
  @words = {}

  def self.words
    @words
  end

  def self.next(word)
    next_data = @words[word.strip.downcase]
    return WordRegistry.words.keys.sample unless next_data
    possibilities = []
    occurences = []
    total = 0
    next_data.each do |possibility, count|
      possibilities.push(possibility)
      occurences.push(count)
      total += count
    end
    choice = rand(total) + 1
    total = 0
    occurences.each_with_index do |number, index|
      total += number
      return possibilities[index] if choice > total
    end
    return WordRegistry.words.keys.sample
  end

  def self.learn(text)
    words = text.split(/[^\w']/).reject(&:empty?).map(&:downcase)
    words.each_with_index do |word, index|
      next if index == (words.length - 1)
      @words[word] = Hash.new(0) unless @words.key?(word)
      @words[word][words[index + 1]] += 1
    end
  end
end

File.open('text_sample.txt', 'r') do |file|
  file.each_line do |line|
    WordRegistry.learn(line)
  end
end

sentence = ''
previous_word = WordRegistry.words.keys.sample
sentence << previous_word + ' '
10.times do
  new_word = WordRegistry.next(previous_word)
  sentence << new_word + ' '
  previous_word = new_word
end

puts sentence

loop do
  puts WordRegistry.next(gets.chomp)
end
