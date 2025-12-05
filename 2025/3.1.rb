lines = File.readlines('3.txt').map(&:chomp)
total = 0

lines.each do |line|
  index = 12
  joltage = ""
  max_value = line[0]
  max_position = 0

  while index >= 1
    max_value = line[max_position]

    (max_position..(line.length - index)).each do |i|
      if line[i] > max_value
        max_value = line[i]
      end
    end

    (max_position...line.length).each do |i|
      if line[i] == max_value
        max_position = i + 1
        break
      end
    end

    joltage += max_value
    index -= 1
  end

  total += joltage.to_i
end

puts "Total joltage: #{total}"