File.open('print_self.rb', 'r') do |file|
  file.each_line do |line|
    puts line
  end
end
