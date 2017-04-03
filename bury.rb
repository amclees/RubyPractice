puts "What is you secret?"
secret = gets.strip.reverse
puts "How many spots are in the hole where you drop your secret?"
spots = gets.strip.to_i
spot = rand(spots) + 1
puts "Your secret is reversed in spot #{ spot }."
Dir.mkdir("hole") unless File::directory?("hole")
Dir.chdir("./hole")
(1..spots).each do |num|
  file = File.new("hole#{ num }.txt", "w")
  if num == spot
    file.syswrite(secret)
  else
    file.syswrite("Your secret is somewhere else.".reverse)
  end
  file.close
end
