require 'prime'

n = ARGV[0].to_i

hash = Hash.new(0)
Prime.each(n) do |num|
  break if n <= 1
  if (n % num).zero?
    n /= num
    hash[num] += 1
    redo
  end
end

puts hash
