require_relative 'board'

module Slideable
    HORIZONTAL_DIRS = [[-7, 0], [-6, 0], [-5, 0], [-4, 0], [-3, 0], [-2, 0], [-1, 0], [1, 0], [2, 0], [3, 0], [4, 0], [5, 0], [6, 0], [7, 0], [0, -7], [0, -6], [0, -5], [0, -4], [0, -3], [0, -2], [0, -1], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]]
    VERTICAL_DIRS = [[-7, -7], [-6, -6], [-5, -5], [-4, -4], [-3, -3], [-2, -2], [-1, -1], [1, 1], [2, 2], [3, 3], [4, 4], [5, 5], [6, 6], [7, 7], [7, -7], [6, -6], [5, -5], [4, -4], [3, -3], [2, -2], [1, -1], [-1, 1], [-2, 2], [-3, 3], [-4, 4], [-5, 5], [-6, 6], [-7, 7]]
    def moves(dirs)
        dirs = self.move_dirs
        moves = []
        if dirs.include?(:horizontal)
            
        end

    end
end

module Stepable
    def moves
    end
end

class Piece
    
    def initialize(color, board, start_pos)
        @color = color
        @board = board
        @pos = start_pos
    end
end