require_relative "card"
require_relative "board"
require "byebug"

class Game
    
    
    def initialize(n)
        @board = Board.new(n)
        @board.populate
        @prev_guessed = []
    end

    def over?
        @board.grid.flatten.all? { |card| card.up }
    end

    def play
        until over?
            system("clear")
            @board.render
            pos_1 = self.prompt
            first_guess = @board.reveal(pos_1)
            @board.render
            pos_2 = self.prompt
            second_guess = @board.reveal(pos_2)
            @board.render
            unless first_guess == second_guess
                @board[pos_1].flip_down
                @board[pos_2].flip_down
            end
            sleep(2)
        end
    end

    def prompt
        puts "Please enter a position like '0 1'"
        #debugger
        input = gets.chomp.split.map(&:to_i)
        input
    end
end