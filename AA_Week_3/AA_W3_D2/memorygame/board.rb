class Board

    ALPHA = ("A".."Z").to_a

    attr_reader :grid

    def initialize(n)
        @grid = Array.new(n) { Array.new(n, "")}
        @values = []
        @cards = []
        @size = n * n
        @values << ALPHA.sample(@size / 2)
        @values += @values
        @values.flatten.each { |value| @cards << Card.new(value) }
    end

    def [](pos)
        @grid[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @grid[pos[0]][pos[1]] = val
    end
    
    def populate
      @cards.shuffle!
      #flatten grid [].length == [].length  i j inner increment j outer increment i @grid[[i,j]] = 
      j = 0
      counter = 0
      while j < @grid.length
        i = 0
        while i < @grid.length
        #@cards.each_with_index do |card, i|
            self[[j , i]] = @cards[counter]
            i += 1
            counter += 1
        end
        j += 1
      end
    end

    def render #go through board and print 
        curr_grid = @grid.map do |row|
            row.map do |card|
                if card.up
                    card.get_value
                else
                    " "
                end
            end
        end
        puts "  " + (0...grid.length).to_a.join(" ")
        curr_grid.each.with_index do |row, i|
            puts i.to_s + " " + row.join(" ")
        end
    end

    def reveal(pos)
        self[pos].flip_up unless self[pos].up
        self[pos].get_value
    end

end