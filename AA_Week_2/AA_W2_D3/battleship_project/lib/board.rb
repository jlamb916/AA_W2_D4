class Board
    attr_reader :size

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](pos)
        row,col = pos
        @grid[row][col]         
    end

    def []=(pos,val)
        row,col = pos
        @grid[row][col] = val
    end

    def num_ships
        @grid.flatten.count {|el| el == :S}
    end

    def attack(pos)
        if self[pos]==:S
            self[pos]=:H
            puts "you sunk my battleship!"
            return true
        else
            self[pos]=:X
            return false
        end        
    end

    def place_random_ships
        required = self.size * 0.25
        while self.num_ships < required
            row,col = rand(0...@grid.length), rand(0...@grid.length)
            @grid[row][col] = :S    
        end
    end

    def hidden_ships_grid
        @grid.map { |sub| sub.map { |ele| ele == :S ? :N : ele}}
    end

    def self.print_grid(grid)
        grid.each { |row| puts row.join(" ")}
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end
end
