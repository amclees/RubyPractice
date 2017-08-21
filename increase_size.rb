program = ''

File.open('increase_size.rb', 'r') do |file|
  file.each_line do |line|
    program << line
  end
end

File.open('increase_size.rb', 'w') do |file|
  file.syswrite(program * 2)
end
