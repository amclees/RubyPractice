from = ARGV[0].to_i
limit = ARGV[1].to_i
check = ARGV[2].to_i

hash = {}
ends = [1, 3, 7, 9]
(from..limit).each do |num|
  if ends.include?(num % 10)
    mult = num
    factor = 1
    while (mult % 10) != 9
      factor += 1
      mult = num * factor
    end
    m = (mult + 1) / 10
    hash[num] = m
  end
end

(from..limit).each do |num|
  m = hash[num]
  while check % 2 == 0
    check /= 2
  end

  while check % 5 == 0
    check /= 5
  end

  q = check % 10
  t = (check - q)
  puts (m * q + t)
end
