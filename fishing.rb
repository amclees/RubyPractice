require "open-uri"

puts "Type in the place where you want to go fishing (i.e. http://<fishing spot>, ./<fishing spot>, etc.)"
spot = gets.strip
spot = "./fishing_spots/los_angeles" if spot.empty?
puts "Enter a 1 if you want to see where you didn't find fish (not recommended for webpages)"
show_failures = gets.strip == "1"
fish = 0
calories = 500
calorie_limiter = rand(73) + (rand(13) * rand(63))
open(spot) do |file|
  file.each_line do |line|
    if calories <= 0
      puts "You died of starvation."
      exit
    elsif calories > 10000 + calorie_limiter
      puts "You exploded due to excess energy."
      exit
    elsif (63..73) === calories
      puts "You were terminated for having a restricted number of calories (63-73)."
      exit
    end
    puts "You have #{ calories } calories left. Press enter to continue fishing"
    gets
    line.gsub!(/<([^>])*>/, "")
    line.strip!
    line_fish = line.scan(/(?=fish)/i).count
    fish += line_fish
    unless line_fish == 0
      puts "--- Catch ---\n#{ line }\n-------------"
      puts "Got #{ line_fish } fish, ate head(s). Currently at #{ fish } fish."
      calories += (15 + rand(100)) * line_fish
    else
      puts "--- Failure ---\n#{ line }\n---------------" if show_failures
      puts "You didn't find a fish, but you expend your energy trying."
      calories -= rand(4) * rand(13)
    end
  end
end
puts "You lived through your fishing trip, taking home #{ fish } headless fish!"
