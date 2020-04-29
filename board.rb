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

    def move_piece(start_pos, end_pos)
        raise "No piece at start position!!" if self[start_pos].nil?
        raise "Cannot move to end position!!" if self.cannot_move
        self[end_pos] = self[start_pos]
        self[start_pos] = nil
        self[end_pos]
    end

    def cannot_move
        false   
    end

    def inspect
        board.map do |row|
            row.map {|ele| :P if ele.is_a?(Piece)}
        end
    end
end