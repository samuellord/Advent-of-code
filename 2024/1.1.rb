list1 = []
list2 = []

File.foreach("1.txt") do |line|
  left, right = line.strip.split(/\s+/)

  list1 << left.to_i
  list2 << right.to_i
end

sorted_list1 = list1.sort
sorted_list2 = list2.sort

distance = sorted_list1.each_with_index.sum do |value, index|
  (value - sorted_list2[index]).abs
end

puts "Total Distance: #{distance}"