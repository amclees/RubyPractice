require 'prime'

n = ARGV[0].to_i

hash = Hash.new(0)
Prime.each(n) do |num|
  break if n <= 1
  next unless (n % num).zero?
  n /= num
  hash[num] += 1
  redo
end

puts hash
