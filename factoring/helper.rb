num1 = ARGV[0].to_i
num2 = ARGV[1].to_i
(1..num1).each do |num|
  prod = num * num2
  digs = prod.to_s.chars.inject { |sum,n| sum = sum.to_i + n.to_i}
  puts "#{prod} --> #{digs} --> #{prod % 10} --> #{digs % 10}"
end
