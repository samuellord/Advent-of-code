lines = File.readlines('3.txt').map(&:chomp)
total = 0
index = 11

lines.each do |line|
  max_value = line[0]
  max_position = 0

  (0...(line.length - )).each do |i|
    if line[i] > max_value
      max_value = line[i]
    end
  end

  # Trouver la première position du maximum !!! :))
  (0...line.length).each do |i|
    if line[i] == max_value
      max_position = i
      break
    end
  end

  second_max_value = nil
    second_max_position = nil


  ((max_position + 1)...line.length).each do |i|
    if second_max_value.nil? || line[i] > second_max_value
      second_max_value = line[i]
      second_max_position = i
    end
  end

  joltage =(max_value.to_s + second_max_value.to_s).to_i
  # puts "Line: #{line}, Max: #{max_value} (Pos #{max_position}), Second Max: #{second_max_value} (Pos #{second_max_position}), Joltage: #{joltage}"
  total += joltage
end
puts "Total joltage: #{total}"


