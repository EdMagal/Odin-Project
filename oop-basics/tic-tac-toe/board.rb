class Board
    attr_accessor :grid
    def initialize
        @grid  = Array.new(3) { Array.new(3, "_") }
    end

    def empty?(pos)
        self[pos] == "_"
    end

    def valid?(pos) # boundary check
        pos.each { |coord| 0 <= coord and coord < @grid.size}
    end

    def place_mark(pos, mark)
        self[pos] = mark if self.valid?(pos) and self.empty?(pos)
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

    # These methods replace @grid[pos[0]][pos[1]] with self[pos]
    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        self[pos] = value
    end
end

b = Board.new
b.print