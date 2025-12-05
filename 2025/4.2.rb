input = File.read("4.txt")
grid = input.split("\n").map(&:chars)
puts grid.inspect
height = grid.length
width = grid[0].length
count = 0

directions = [
  [0, 1],   # bas
  [1, 0],   # droite
  [0, -1],  # haut
  [-1, 0],  # gauche
  [1, 1],   # diago bas-droite
  [1, -1],  # diago haut-droite
  [-1, -1], # diago haut-gauche
  [-1, 1]   # diago bas-gauche
]
repeat=true
while repeat
  repeat=false
  grid.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      if cell == "@"
        papers = 0
        directions.each do |dx, dy|
          nx, ny = x + dx, y + dy

          if ny >= 0 && ny < height && nx >= 0 && nx < width
            papers += 1 if grid[ny][nx] == "@"
          end
        end

        if papers < 4
          count += 1
          grid[y][x] = "."
          repeat=true
        end
      end
    end
  end
end

puts count