input = File.read("3.txt")
# The parentheses around \d{1,3} in the regex mul\((\d{1,3}),(\d{1,3})\) create capture groups to extract the two numbers. :))))
#Regex cest magique haha
valid_mul_regex = /mul\((\d{1,3}),(\d{1,3})\)/
result = input.scan(valid_mul_regex).map { |x, y| x.to_i * y.to_i }.sum
puts result


