
def is_adjacent?(array_2d, i, j)
  return true if array_2d[i][j+1] && array_2d[i][j+1] != '.' && array_2d[i][j+1] !~ /\d/
  return true if j > 0 && array_2d[i][j-1] && array_2d[i][j-1] != '.' && array_2d[i][j-1] !~ /\d/
  return true if i > 0 && array_2d[i-1][j] && array_2d[i-1][j] != '.' && array_2d[i-1][j] !~ /\d/
  return true if array_2d[i+1] && array_2d[i+1][j] != '.' && array_2d[i+1][j] !~ /\d/
  return true if i > 0 && j > 0 && array_2d[i-1][j-1] && array_2d[i-1][j-1] != '.' && array_2d[i-1][j-1] !~ /\d/
  return true if i > 0 && array_2d[i-1][j+1] && array_2d[i-1][j+1] != '.' && array_2d[i-1][j+1] !~ /\d/
  return true if array_2d[i+1] && j > 0 && array_2d[i+1][j-1] && array_2d[i+1][j-1] != '.' && array_2d[i+1][j-1] !~ /\d/
  return true if array_2d[i+1] && array_2d[i+1][j+1] && array_2d[i+1][j+1] != '.' && array_2d[i+1][j+1] !~ /\d/
  false
end

filename = '../inputs/3.txt'
content = IO.read(filename)
total = 0

array_2d = []

content.each_line do |line|
  array_2d << line.strip.split('')
end

# test to manipulate array
char = array_2d[0][5]
puts char

number = ""
is_adjacent = false
array_2d.each_with_index do |line, i|
  line.each_with_index do |char, j|
    if char =~ /\d/
      number += char
      if is_adjacent?(array_2d, i, j)
        is_adjacent = true
      end
    else
      unless number.empty?
        total += number.to_i
        number = ""
        is_adjacent = false
      end
    end
  end
end
puts total


