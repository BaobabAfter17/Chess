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
        current_pos = [start_x + dx, start_y + dy]

        moves = []

        while self.valid_move?(current_pos)
            current_piece = board[current_pos]
            if current_piece == NullPiece.instance
                moves << current_pos
            elsif current_piece.color != self.color
                moves << current_pos
                break
            else # same color pieces
                break
            end
            current_pos = [current_pos[0] + dx, current_pos[1] + dy]
        end

        moves
    end

    
end

module Stepable
    def moves
        moves = []
        self.move_diffs.each do |diff|
            dx, dy = diff
            pos = self.pos[0] + dx, self.pos[1] + dy
            if self.valid_move?(pos) && board[pos].color != self.color
                moves << pos
            end
        end
        moves
    end
end

class Piece
    attr_reader :color, :board
    attr_accessor :pos
    def initialize(color, board, start_pos)
        @color = color
        @board = board
        @pos = start_pos
    end
    
    protected

    def valid_move?(pos)
        x, y = pos
        x.between?(0, 7) && y.between?(0, 7)
    end

end