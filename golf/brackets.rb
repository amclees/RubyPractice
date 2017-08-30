a = ->{s='';d=0;e=0;1000.times{e=rand(20)+5;s<<(d<e ? '[':']');d+=(d<e) ? 1 : -1};s+(']'*(e-1))}
puts a.call
