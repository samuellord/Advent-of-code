input = File.read("3.txt")
# L’opérateur | permet de définir une alternative dans le regex.
# Les <> ne créent pas une “variable” au sens propre de Ruby (comme une variable dans un programme), mais ils nomment une partie spécifique d’une correspondance.
# Cela permet d’accéder directement aux données capturées via leur nom. :))))
regex = /mul\((?<num1>\d{1,3}),(?<num2>\d{1,3})\)|(?<action>do\(\)|don't\(\))/

results = input.scan(regex).map do |num1, num2, command|
  if action.nil?
    [num1.to_i, num2.to_i]
  else
    action
  end
end

puts results.inspect

flag = 0
counter = 0
results.each do |result|
  if result == "do()"
    flag = 0
  elsif result == "don't()"
    flag = -1
  elsif result.is_a?(Array)  &&  flag == 0
   counter =+ result[0] * result[1]
  end
end
puts counter