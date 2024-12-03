lines_as_arrays = File.readlines("2.txt").map do |line|
  line.split.map(&:to_i)
end

safe = 0
lines_as_arrays.each do |line|
  direction = 0
  line_safe = 1
  mulligan = 0

  i = 0
  while i < line.size - 1
    if line[i] < line[i + 1] && direction <= 0 && (line[i + 1] - line[i]).abs <= 3
      direction = -1
    elsif line[i] > line[i + 1] && direction >= 0 && (line[i] - line[i + 1]).abs <= 3
      direction = 1
    else
      if mulligan >0 && i == 1 && (line[i + 1] - line[i]).abs <= 3
        direction = 0
        i+=1
        next
      end
      if mulligan == 0
        line.delete_at(i + 1)
        mulligan += 1
        next
      else
        line_safe = -1
        break
      end
    end
    i += 1
  end

  if line_safe == 1
    safe += 1
    puts "Line #{line} is safe"
  end
end

puts "Total safe lines: #{safe}"