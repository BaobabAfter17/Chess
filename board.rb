require_relative 'piece'
require_relative 'null_piece'

class Board

    attr_reader :board

    def initialize
        @board = Array.new(8) {Array.new(8, nil)}
        @board.map! {|row| row.map! {NullPiece.instance}}
    end

    def [](pos)
        row, col = pos
        board[row][col]
    end

    def []=(pos, piece)
        row, col = pos
        @board[row][col] = piece # board[row][col] = val should also work, but logically not right
        piece.pos = pos
    end

    def move_piece(start_pos, end_pos)
        raise "No piece at start position!!" if self[start_pos] == NullPiece.instance
        raise "Cannot move to end position!!" if !self[start_pos].moves.include?(end_pos)
        self[end_pos] = self[start_pos]
        self[start_pos] = NullPiece.instance
        true
    end


    def inspect
        board.map do |row|
            row.map {|ele| ele.symbol}
        end
    end
end