constraints = []
activities = []
File.open("energymanagement.txt", "rb").each.with_index do |x,i|
  next if i == 0
  constraints << x.strip.split.map{|x|x.to_i} if i % 2 == 1
  activities << x.strip.split.map{|x|x.to_i} if i % 2 == 0
end

constraints.each.with_index do |x,i|
  max_energy =  x[0]
  current_energy = x[0]
  rest_gain = x[1]
  points = 0
  loc_max = 0
  look_ahead = (max_energy / rest_gain)
  a = activities[i]
  a.each.with_index do |act,j|
    if not a[j+1] == nil
      if act > a[j+1]
        points += current_energy * act
        current_energy = rest_gain
        puts "allin myenergy #{current_energy} points#{points} act #{act}"
      else
        points +=  rest_gain * act
        puts "not all in myenergy #{current_energy} points#{points} act #{act}"
      end
    else
      puts "myenergy #{current_energy} points#{points} act #{act}"
      points += current_energy * act
    end
  end
  puts points
  puts ""
end