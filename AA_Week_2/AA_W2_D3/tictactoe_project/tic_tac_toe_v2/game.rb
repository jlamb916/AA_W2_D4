require_relative 'board'
require_relative 'human_player'
require "byebug"

class Game
    
    def initialize(n, *marks)
        @board = Board.new(n)
        @players = marks.map { |mark| HumanPlayer.new(mark)}
        @current_player = @players[0]  
    end

    def switch_turn 
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_position?
            @board.print
            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                puts "victory for #{@current_player}"
                return true
            else
                switch_turn
            end
        end
        puts "Draw"
    end

end