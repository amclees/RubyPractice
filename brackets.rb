# frozen_string_literal: false
depth = 0
threshold = ARGV[0].chomp.to_f
limit = ARGV[1].chomp.to_f

out = ''
broke_limit = false
loop do
  if depth > limit
    broke_limit = true
  end
  if broke_limit
    threshold += 0.1 * rand
  end
  if rand > threshold
    out << '('
    depth += 1
  elsif depth > 0
    out << ')'
    depth -= 1
  else
    if rand > 0.5
      break
    end
  end
end

puts out
