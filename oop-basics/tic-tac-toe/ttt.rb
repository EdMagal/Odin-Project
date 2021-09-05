require_relative "board"
require_relative "player"

class Game
    # initialize players and board
    def initialize(p1_mark, p2_mark)
        @p1 = HumanPlayer.new(p1_mark)
        @p2 = HumanPlayer.new(p2_mark)
        @current_player = @p1
        @board = Board.new
    end

    def play
        
    end
    
    
    # game starts, players take turn until game ends
    # display board
    # prompt player to make a move
    # checks for win
    # next turn
end