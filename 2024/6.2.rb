require 'set'

input = File.read("6.txt")
grid = input.split("\n").map(&:chars)

guard = {
  position: [0, 0],
  direction: ""
}

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
        return
      end
    end
  end
end

def move(grid, guard, visited_positions)
  x, y = guard[:position]

  return :loop if visited_positions.include?([x, y, guard[:direction]])

  visited_positions.add([x, y, guard[:direction]])

  dx, dy = case guard[:direction]
  when "<" then [-1, 0]
  when ">" then [1, 0]
  when "^" then [0, -1]
  when "v" then [0, 1]
  end

  nx, ny = x + dx, y + dy

  if ny < 0 || ny >= grid.size || nx < 0 || nx >= grid[0].size
    return :out_of_bounds
  end

  if grid[ny][nx] == "#"
    guard[:direction] = turn_right(guard[:direction])
  else
    guard[:position] = [nx, ny]
  end

  move(grid, guard, visited_positions)
end

get_initial_position(grid, guard)

loop_count = 0

grid.each_with_index do |row, y|
  row.each_with_index do |cell, x|
    next if [x, y] == guard[:position]
    original_cell = grid[y][x]
    grid[y][x] = "#"
    visited_positions = Set.new
    result = move(grid, guard.dup, visited_positions)
    if result == :loop
      loop_count += 1
    end
    grid[y][x] = original_cell
  end
end

puts loop_count