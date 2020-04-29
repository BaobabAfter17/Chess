require_relative 'piece'

class Board

    attr_reader :board

    START_ROWS = [0, 1, 6, 7]
    def initialize
        @board = Array.new(8) {Array.new(8, nil)}
        START_ROWS.each do |row_idx|
            @board[row_idx].map! {Piece.new}
        end
    end

    def [](pos)
        row, col = pos
        board[row][col]
    end

    def []=(pos, val)
        row, col = pos
        @board[row][col] = val # board[row][col] = val should also work, but logically not right
    end
end