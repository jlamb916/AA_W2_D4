class Board

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, '_') }
    end

    def [](pos)
        row,col = pos
        @grid[row][col]         
    end

    def []=(pos,val)
        row,col = pos
        @grid[row][col] = val
    end

    def valid?(pos)       
        pos.all? { |el| el >= 0 && el <= @grid.length - 1 }
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def place_mark(pos, mark)
        if !valid?(pos) or !empty?(pos)
            raise "Error placing mark : either not empty or invalid"
        end
        self[pos] = mark
    end

    def print
        @grid.each {|row| puts row.join(" ")}        
    end

    def win_row?(mark)
        @grid.any? {|row| row.all? {|el| el == mark}} 
    end

    def win_col?(mark)
        @grid.transpose.any? {|row| row.all? {|el| el == mark}}
    end

    def win_diagonal?(mark)
        a = (0...@grid.length).all? {|i| self[[i,i]] == mark   }
        b = (0...@grid.length).all? {|i| self[[i, @grid.length - 1 - i]] == mark }
        a || b
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_position?
        @grid.flatten.any? { |ele| ele == '_' }
    end

    def legal_positions
        availabe_pos = []
        (0...@grid.length).each do |i|        
            (0...@grid.length).each do |j|        
                if self.empty?([i,j])
                    availabe_pos << [i,j]
                end
            end
        end
        availabe_pos
    end
end