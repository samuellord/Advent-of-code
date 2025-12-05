input = File.read("6.txt")
grid = input.split("\n").map(&:chars)

guard = {
  position: [0, 0],
  direction: ""
}
# cest cool les thens
def turn_right(direction)
  case direction
  when "<" then "^"
  when "^" then ">"
  when ">" then "v"
  when "v" then "<"
  end
end

def get_initial_position(grid, guard)
  grid.each_with_index do |row, y|
    row.each_with_index do |char, x|
      if ['<', '>', '^', 'v'].include?(char)
        guard[:position] = [x, y]
        guard[:direction] = char
      end
    end
  end
end

def move(grid, guard, counter)

  x, y = guard[:position]
  grid[y][x] = "X" unless grid[y][x] == "#"


  dx, dy = case guard[:direction]
  when "<" then [-1, 0]
  when ">" then [1, 0]
  when "^" then [0, -1]
  when "v" then [0, 1]
  end

nx, ny = x + dx, y + dy

if ny < 0 || ny >= grid.size || nx < 0 || nx >= grid[0].size
  return counter
end

if grid[ny][nx] == "#"
  guard[:direction] = turn_right(guard[:direction])
else
  guard[:position] = [nx, ny]
end

move(grid, guard, counter + 1)
end


get_initial_position(grid, guard)
move(grid, guard, 0)

unique_positions = grid.flatten.count { |cell| cell == 'X' }
puts unique_positions
# end