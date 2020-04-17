class Computer
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position(legal)
        legal.sample
    end
    
end