result = 50
counter = 0

instructions = File.readlines("1.txt", chomp: true).map do |line|
  { direction: line[0], value: line[1..].to_i }
end

instructions.each do |inst|
  step = inst[:direction] == "R" ? 1 : -1
  move = inst[:value]



  total = result + step * move
  if step > 0
    counter += (total / 100) - (result / 100)
  else

    
    counter += ((result - 1) / 100) - ((total - 1) / 100)
  end

  result = total % 100
end

puts "Passages par 0 : #{counter}"