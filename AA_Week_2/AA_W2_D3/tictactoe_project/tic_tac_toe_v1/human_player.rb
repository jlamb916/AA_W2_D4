class HumanPlayer
    
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Enter row col for position '0 2' "
        input = gets.chomp
        
        input.split.each do |el|
            if !("0".."9").to_a.include?(el)
                raise "Numbers Only"                
            end
        end
        
        pos = input.split(" ").map(&:to_i)
        if input.length != 3 
            raise "Invalid input"
        end
        pos
    end

end