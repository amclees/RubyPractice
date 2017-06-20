def match input, regex
  regex.each_char do |char|
    case char
    when '.'
      
    when '*'

    when '|'

    when '('

    when ')'

    when '\\'
    end
  end
  true
end
