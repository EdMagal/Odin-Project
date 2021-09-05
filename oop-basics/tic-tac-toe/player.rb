class Player
    def initialize(mark)
        @mark = mark
    end

    def move
        puts "Please enter row and column coordinates (e.g.: 0 2): "
        pos = gets.chomp
        pos = pos.split(" ")
                 .map(:&to_i)
        pos
    end
end