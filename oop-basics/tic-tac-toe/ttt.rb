require_relative "board"
require_relative "player"

class Game
    # initialize players and board
    def initialize(p1_mark, p2_mark)
        @p1 = Player.new(p1_mark)
        @p2 = Player.new(p2_mark)
        @current_player = @p1
        @board = Board.new
    end

    def play
        while @board.empty_positions?
            system("clear")
            system("cls")
            @board.print
            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            win = @board.win?(mark)
            if win
                puts "Player #{mark} wins. Good job."
                return @current_player.mark # ends the game
            end
            switch_player
        end
        puts "draw"
    end
    
    def switch_player
        @current_player = @current_player == @p1 ? @p2 : @p1
    end
end

game = Game.new('X', 'O')
game.play