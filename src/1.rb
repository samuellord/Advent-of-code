filename= '../inputs/1.txt'
content= IO.read(filename)
total = 0
content.each_line do |line|
  number = line[/\d/] + line[/\d(?=\D*$)/]
  total+= number.to_i
  #notes pour moi
  #\D means non-digit
  #* means zero or more
  #$ means end of string
  puts number
end
puts total
