filename = '../inputs/2.txt'
content = IO.read(filename)

games = {}
r = 12
g = 13
b = 14
total = 0

content.each_line do |line|
  game_id, piges = line.split(': ')
  # convertirr string to int
  game_id = game_id.gsub('Game ', '').to_i

  max_values = { 'red' => 0, 'green' => 0, 'blue' => 0 }

  piges.split('; ').each do |pige|
    pige.split(', ').each do |color_count|
      count, color = color_count.split(' ')
      count = count.to_i

      if max_values.has_key?(color)
        max_values[color] = [max_values[color], count].max
      end
    end
  end

  games[game_id] = max_values
end

puts games
# {1=>{"red"=>5, "green"=>1, "blue"=>16}, 2=>{"red"=>4, "green"=>7, "blue"=>9}, 3=>{"red"=>9, "green"=>1, "blue"=>19}....


# part 1

games.each do |game_id, max_values|
  if max_values['red'] <= r && max_values['green'] <= g && max_values['blue'] <= b
    total += game_id
  end
end

puts "part 1:  " + total.to_s

# part 2
total = 0
games.each do |game_id, max_values|
  power = (max_values['red'].to_i * max_values['green'].to_i * max_values['blue'].to_i)
  total += power
end

puts "part 2:  " + total.to_s
