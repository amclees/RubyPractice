# frozen_string_literal: false

lam = ->n{a=0;b=2;c=1;n.times{if a==b then c=0;b+=2;end;c=1 if a==1;a+=c==0?-1:1};a}

test_output = '{'
test_output << (1..100).to_a.map { |element| lam.call(element).to_s }.join(', ')
test_output << '}'
puts test_output

puts lam.call(150_000_000)
