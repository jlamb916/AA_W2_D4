require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'
require "byebug"

class Game
    
    def initialize(n, hash)
        @board = Board.new(n)
        @players = hash.map do |mark , bool|
            if bool == "false"
                HumanPlayer.new(mark)
            else
                Computer.new(mark)
            end
        end
        @current_player = @players[0]  
    end

    def switch_turn 
        @current_player = @players.rotate![0]
    end

    def play
        while @board.empty_position?
            @board.print
            legal = @board.legal_positions
            puts "its #{@current_player.mark}'s turn!'"
            pos = @current_player.get_position(legal)
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