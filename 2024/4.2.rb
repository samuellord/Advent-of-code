# quel CANCER ce problème
input = File.read("4.txt")
grid = input.split("\n").map(&:chars)
counter = 0

def check(grid, row, col)
  if row > 0 && col > 0 && row < grid.size - 1 && col < grid[0].size - 1
    top_left = grid[row - 1][col - 1]
    top_right = grid[row - 1][col + 1]
    bottom_left = grid[row + 1][col - 1]
    bottom_right = grid[row + 1][col + 1]


    if ((top_left == 'M' && bottom_right == 'S') || (top_left == 'S' && bottom_right == 'M')) &&
       ((bottom_left == 'M' && top_right == 'S') || (bottom_left == 'S' && top_right == 'M'))
      return true
    end
  end

  return false
end

grid.each_with_index do |row, r|
  row.each_with_index do |cell, c|
    if cell == 'A'
      if check(grid, r, c)
        counter += 1
      end
    end
  end
end
puts counter