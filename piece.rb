require_relative 'board'

module Slideable
    HORIZONTAL_DIRS = [[-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
    DIAGONAL_DIRS = [[-7, -7], [-6, -6], [-5, -5], [-4, -4], [-3, -3], [-2, -2], [-1, -1], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [7, -7], [6, -6], [5, -5], [4, -4], [3, -3], [2, -2], [1, -1], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
    def moves
        dirs = self.move_dirs
        moves = []
        moves += self.pick_moves_in(HORIZONTAL_DIRS) if dirs.include?(:horizontal)
        moves += self.pick_moves_in(DIAGONAL_DIRS) if dirs.include?(:diagonal)
        moves
    end

    protected

    def pick_moves_in(dirs)
        start_row, start_col = self.pos

        dirs.map {|delta| [start_row + delta[0], start_col + delta[1]]}
            .select {|pos| self.valid_pos?(pos)}
    end

    
end

module Stepable
    def moves
    end
end

class Piece
    attr_reader :color, :board, :pos
    def initialize(color, board, start_pos)
        @color = color
        @board = board
        @pos = start_pos
    end

    protected

    def valid_pos?(pos)
        row, col = pos
        row.between?(0, 7) && col.between?(0, 7)
    end
end