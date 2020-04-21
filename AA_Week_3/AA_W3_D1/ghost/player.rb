class Player

    def initialize(name)
      @name = name
    end

    def guess
      puts "Enter a letter from 'a' to 'z' "
      input = gets.chomp

      if !alert_invalid_guess(input)
        raise "error"
      end
      return input
    end

    def alert_invalid_guess(input)
      if !('a'..'z').to_a.include?(input)
        return false
      end
      return true
    end



end