filename = '../inputs/1.txt'
content = IO.read(filename)
total = 0

# hehehehe
map = {
  'zero' => 'ze0ro',
  'one' => 'o1ne',
  'two' => 'tw2o',
  'three' => 'thr3ee',
  'four' => 'fo4ur',
  'five' => 'fi5ve',
  'six' => 's6ix',
  'seven' => 'se7ven',
  'eight' => 'ei8ght',
  'nine' => 'ni9ne'
}

content.each_line do |line|
  map.each do |key, value|
    line.gsub!(/#{key}/, value)
  end
  number = first_digit = line[/\d/] + last_digit = line[/\d(?=\D*$)/]
  total += number.to_i
end

puts total
