require 'benchmark'

require_relative './merge_sort.rb'
require_relative './quicksort.rb'

puts 'Small array merge sort'
a = [1, 6, 3, 1, 5, 23, 92, 5, 23, 7, 14]
puts "[#{merge_sort(a).join(', ')}]"

puts 'Small array quicksort'
puts "[#{quicksort(a).join(', ')}]"

a = []
1_000_000.times do
  a.push(rand(1000))
end
puts "#{a.length} element array with merge sort"
puts(Benchmark.measure do
  merge_sort(a)
end)

q = a.clone
puts "#{a.length} element array with quicksort"
puts(Benchmark.measure do
  quicksort!(q)
end)


puts "#{a.length} element array with default Ruby sort"
puts(Benchmark.measure do
  a.sort
end)
