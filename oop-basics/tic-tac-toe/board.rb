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

    def win_row?(mark)
        @grid.any? { |row| row.all?(mark) }
    end

    def win_col?(mark)
        @grid.transpose.any? { |col| col.all?(mark) }
    end

    def win_diagonal?(mark)
        len = @grid.size
        ltr = (0...len).map { |i| @grid[i][i] }.all?(mark) # left to right
        rtl = (0...len).map { |i| @grid[i].reverse[i] }.all?(mark) # right to left
        ltr or rtl
    end

    def win?(mark)
        win_row?(mark) or win_col?(mark) or win_diagonal?(mark)
    end

    def empty_positions?
        empty = "_"
        @grid.flatten.any?(empty)
    end

    # Replaces @grid[pos[0]][pos[1]] with self[pos]
    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos, value)
        row, col = pos
        @grid[row][col] = value
    end
end