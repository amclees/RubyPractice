puts "Hello World!"
puts "Put some input in:"
input = gets.strip
puts "You didn't type cat" unless input == "cat"
puts "You typed the reverse of 1234" if input.reverse == "1234"
puts "Put a prefix in:"
map1 = gets.strip
puts "Put a suffix in:"
map2 = gets.strip
input.split("cat").each do |char|
  puts "#{ map1 } #{ char } #{ map2 }"
end
