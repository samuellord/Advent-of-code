input = File.read("5.txt").strip

pairs_part, lines_part = input.split("\n\n")

pairs = pairs_part.split("\n").map { |line| line.split('|').map(&:to_i) }

lines = lines_part.split("\n").map { |line| line.split(',').map(&:to_i) }

counter = 0
bad_lines = []

lines.each do |line|
  valid = true
  pairs.each do |pair|
    pos1 = line.index(pair[0])
    pos2 = line.index(pair[1])
    if pos1.nil? || pos2.nil?
       next
    end
    if pos1 > pos2
       valid = false
       bad_lines << line
      break;
    end
  end
end

puts "Bad lines: #{bad_lines}"
sorted_lines = []

bad_lines.each do |line|
  line_sorted = line.dup
  swap = true
  while swap
    swap = false
    pairs.each do |pair|
      pos1 = line_sorted.index(pair[0])
      pos2 = line_sorted.index(pair[1])

      if !pos1.nil? && !pos2.nil? && pos1 > pos2
        line_sorted[pos1], line_sorted[pos2] = line_sorted[pos2], line_sorted[pos1]
        swap = true
      end
    end
  end

  sorted_lines << line_sorted
end

sorted_lines.each do |line|
  counter += line[line.size / 2]
end

puts counter