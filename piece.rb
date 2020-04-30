require_relative 'board'

module Slideable
    HORIZONTAL_DIRS = [[-1, 0], [0, -1], [0, 1], [1, 0]]
    DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]
    def moves
        dirs = self.move_dirs
        moves = []
        moves += self.pick_moves_in(HORIZONTAL_DIRS) if dirs.include?(:horizontal)
        moves += self.pick_moves_in(DIAGONAL_DIRS) if dirs.include?(:diagonal)
        moves
    end

    protected

    def pick_moves_in(dirs)
        moves = []
        dirs.each {|dir| moves += self.grow_unblocked_move_in(dir)}
        moves
    end

    def grow_unblocked_move_in(dir)
        dx, dy = dir
        start_x, start_y = self.pos
        current_x, current_y = start_x + dx, start_y + dy
        moves = []

        while current_x.between?(0, 7) && current_y.between?(0, 7)
            current_pos = [current_x, current_y]
            current_piece = board[current_pos]
            if current_piece == NullPiece.instance
                moves << current_pos
            elsif current_piece.color != self.color
                moves << current_pos
                break
            else # same color pieces
                break
            end
            current_x += dx
            current_y += dy
        end
        
        moves
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

end