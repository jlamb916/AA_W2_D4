class HumanPlayer
    
    attr_reader :mark

    def initialize(mark)
        @mark = mark
    end

    def number_only(input)
        input.split.each do |el|
            if !("0".."9").to_a.include?(el)
                return false          
            end
        end
        true
    end

    def invalid_input(input)
        if input.length != 3 
            return false
        end
        true
    end

    def get_position(arr)
        puts "Enter row col for position '0 2' "
        flag = true
        while flag
            flag = false
            input = gets.chomp
            pos = input.split(" ").map(&:to_i)
            if !number_only(input) || !invalid_input(input)
                puts "Try again"
                flag = true
            end
        end
        pos
    end

end