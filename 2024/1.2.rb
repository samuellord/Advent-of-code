# Fetch les données du fichier
list1 = []
list2 = []

File.foreach("1.txt") do |line|
  left, right = line.strip.split(/\s+/)

  list1 << left.to_i
  list2 << right.to_i
end

sorted_list2 = list2.sort
# The hash freq is constructed with unique keys. In Ruby, a hash cannot have duplicate keys;
# if you try to add a new key-value pair with a key that already exists, it updates the value for that key instead of adding a new entry.:))
# 1.	Initial State:
# •	freq = Hash.new(0) means freq is an empty hash where non-existent keys return 0 when accessed.
# 2.	First Iteration (num = 3):
# •	freq[3] += 1 → freq = {3 => 1}.
# 3.	Second Iteration (num = 5):
# •	freq[5] += 1 → freq = {3 => 1, 5 => 1}.
# 4.	Third Iteration (num = 3):
# •	freq[3] += 1 → freq = {3 => 2, 5 => 1}.
# 5.	Fourth Iteration (num = 7):
# •	freq[7] += 1 → freq = {3 => 2, 5 => 1, 7 => 1}.
# 6.	Fifth Iteration (num = 5):
# •	freq[5] += 1 → freq = {3 => 2, 5 => 2, 7 => 1}.
# 7.	Sixth Iteration (num = 5):
# •	freq[5] += 1 → freq = {3 => 2, 5 => 3, 7 => 1}.

# Why Use Hash.new(0)?

# •	Default Value: Using Hash.new(0) allows you to safely increment counts without having to check if a key exists. Without it, you would need to write code like:
frequency_map = sorted_list2.each_with_object(Hash.new(0)) do |num, freq|
  freq[num] += 1
end

results = list1.map do |num|
  count = frequency_map[num] || 0
  num * count
end

total_sum = results.sum
puts frequency_map.inspect
# puts "Original List 1: #{list1.inspect}"
# puts "Original List 2: #{list2.inspect}"

# puts "Results: #{results.inspect}"
# puts "Total Sum of Results: #{total_sum}"