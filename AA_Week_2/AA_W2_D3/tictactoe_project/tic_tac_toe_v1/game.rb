require_relative 'board'
require_relative 'human_player'
require "byebug"

class Game
    
    def initialize(player1_mark, player2_mark)
        @board = Board.new
        @player1 = HumanPlayer.new(player1_mark)
        @player2 = HumanPlayer.new(player2_mark)
        @current_player = @player1        
    end

    def switch_turn
        if @current_player == @player1
            @current_player = @player2
        else
            @current_player = @player1
        end
    end

    def play
        while @board.empty_position?
            @board.print
            #debugger
            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                puts "victory"
                return true
            else
                switch_turn
            end
        end
        puts "Draw"
    end

end