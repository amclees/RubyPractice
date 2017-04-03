class Bicycle
  attr_accessor :speed, :traveled, :durability
  def initialize
    @speed = 10
    @traveled = 0
    @durability = rand(100) + 50
  end
  def speedUp( speed )
    @speed += speed unless durability <= 0 or speed < 0
    if (63...74) === @speed # Or could do (63...74).contains?(@speed)
      puts "You are traveling at a restricted speed (63-73) and have been terminated."
      exit
    end
    keepGoing
  end
  def keepGoing
    @traveled += @speed
    @durability -= @speed
    if durability <= 0
      puts "Your bike broke after having traveled #{ @traveled }μm!"
      exit
    end
  end
  def toString
    "Speed #{ @speed } Traveled #{ @traveled } Durability #{ @durability }"
  end
end
bike = Bicycle.new
exit = false
while !exit
  puts bike.toString
  puts "Enter 0 to exit, 1 to speed up, 2 to keep going"
  case gets.strip
  when "0"
    exit = true
  when "1"
    puts "How much would you like to speed up?"
    bike.speedUp(gets.strip.to_i)
  when "2"
    bike.keepGoing
  else
    puts "You fell off your bike."
    exit = true
  end

  if rand < 1 - 1 / (bike.speed / 10)
    puts "You found a bike repair kit! +100 durability"
    bike.durability += 100
  end
end
