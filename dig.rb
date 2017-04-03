puts "Where did you put your secret?"
hole = gets.strip
unless File::directory?("hole")
  puts "No hole to dig in"
  exit
end
Dir.chdir("./hole")
unless File::exists?("hole#{hole}.txt")
  puts "The hole doesn't have that spot!"
  exit
end
File.open("hole#{hole}.txt", "r").each_line do |line|
  puts "Your secret is:\n#{ line.reverse }"
end
