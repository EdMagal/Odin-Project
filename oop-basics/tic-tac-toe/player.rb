class Player
    attr_accessor :mark
    def initialize(mark)
        @mark = mark
    end

    def get_position
        puts "Please enter row and column coordinates (e.g.: 0 2): "
        pos = gets.chomp
        raise "RuntimeError: sorry, that was invalid :(" unless pos.match(/^\d\s\d$/)
        pos = pos.split(" ").map(&:to_i)
        pos
    end
end