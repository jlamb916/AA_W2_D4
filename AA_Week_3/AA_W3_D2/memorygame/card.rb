class Card

    attr_reader :up

    def initialize(val)
        @value = val
        @up = false
    end

    def flip_down
        @up = false if @up == true
    end

    def flip_up
        @up = true if @up == false
    end

    def get_value
        @value if @up
    end

    def ==(card)
        self.get_value == card.get_value
    end

end