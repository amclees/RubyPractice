require 'benchmark'

require_relative './merge_sort.rb'

puts 'Small array'
a = [1, 6, 3, 1, 5, 23, 92, 5, 23, 7, 14]
puts "[#{merge_sort(a).join(', ')}]"

a = []
1_000_000.times do
  a.push(rand(1000))
end
puts "#{a.length} element array with merge sort"
puts(Benchmark.measure do
  merge_sort(a)
end)

puts "#{a.length} element array with default Ruby sort"
puts(Benchmark.measure do
  a.sort
end)
