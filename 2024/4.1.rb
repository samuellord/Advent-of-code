
counter = 0

input = File.read("4.txt")
grid = input.split("\n").map(&:chars)
DIRECTIONS = [
  [-1, 0],
  [1, 0],
  [0, -1],
  [0, 1],
  [-1, -1],
  [-1, 1],
  [1, -1],
  [1, 1]
]

def find_NOEL(grid, row, col, direction)
  word = ""
  i=0
  while i < 4
    new_row = row + i * direction[0]
    new_col = col + i * direction[1]

    # ca ne marche pas avec juste un nil check et dig ?
    return false if new_row < 0 || new_row >= grid.size || new_col < 0 || new_col >= grid[0].size


    word << grid[new_row][new_col]
    i += 1
  end

  if word == "XMAS"
    return true
  end
end

grid.each_with_index do |row, r|
  row.each_with_index do |cell, c|
    DIRECTIONS.each do |direction|
      counter += 1 if find_NOEL( grid, r, c, direction)
    end
  end
end


puts counter