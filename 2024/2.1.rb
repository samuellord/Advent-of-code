lines_as_arrays = File.readlines("2.txt").map do |line|
  line.split.map(&:to_i)
end

safe = 0
lines_as_arrays.each do |line|
  direction = 0
  line_safe = 1

  (0...line.size - 1).each do |i|
    if line[i] < line[i + 1] && direction <= 0 && (line[i + 1] - line[i]).abs <= 3
      direction = -1
    elsif line[i] > line[i + 1] && direction >= 0 && (line[i] - line[i + 1]).abs <= 3
      direction = 1
    else
      line_safe = -1
      break
    end
  end

  safe += 1 if line_safe == 1
  puts "Line #{line} is safe" if line_safe == 1
end

puts "Total safe lines: #{safe}"