result = 50
counter = 0
inputs = File.readlines('1.txt', chomp: true).map do |line|
  { direction: line[0], value: line[1..].to_i }
end

inputs.each do |input|
  puts "Direction: #{input[:direction]}, Value: #{input[:value]}"
end

inputs.each do |input|
  if input[:direction] == "R"
    result += input[:value]
  else
    result -= input[:value]
  end

  result = result % 100



  if result == 0
    counter += 1
  end
end

puts "Current Result: #{result}, Counter: #{counter}"
