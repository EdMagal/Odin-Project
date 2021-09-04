class Board
    attr_accessor :grid
    def initialize
        @grid  = Array.new(3) { Array.new(3, "_") }
    end

    def print
        @grid.each do |row|
            puts "====" * @grid.size + "="
            printf "| "
            printf row.join(" | ").gsub("_", " ")
            puts " |"
        end
        puts "====" * @grid.size + "="
    end
end

b = Board.new
b.print