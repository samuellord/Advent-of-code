input = File.read("5.txt").strip

pairs_part, lines_part = input.split("\n\n")

pairs = pairs_part.split("\n").map { |line| line.split('|').map(&:to_i) }

lines = lines_part.split("\n").map { |line| line.split(',').map(&:to_i) }

counter = 0

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
      break;
    end
  end
  if valid
    counter += line[line.size / 2]
  end
end

puts counter