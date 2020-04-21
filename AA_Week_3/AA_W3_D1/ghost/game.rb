require_relative "./dictionary"
require_relative "./player"
require 'byebug'
class Game

    def initialize(player_1, player_2)
        @player_1 = Player.new(player_1)
        @player_2 = Player.new(player_2)
        @current_player = @player_1
        # @players = players.map {|player|}
        @fragment = ""
        @dictionary = DICTIONARY
    end

    def next_player!
      if @current_player == @player_1
        @current_player = @player_2 
        @previous_player = @player_1
      else
        @current_player = @player_1
        @previous_plyer = @player_2
      end
    end
    
    def valid_guess(tmp)
      if @dictionary.include?(tmp)
        return true
      else
        return false
      end
    end

    def play_round
      debugger
        input = @current_player.guess
        tmp = @fragment + input
        # debugger
        if valid_guess(tmp)
            @fragment = tmp
        else
          self.play_round
          return false
        end
        self.next_player!
    end

end
