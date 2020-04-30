require_relative 'piece'

class Pawn < Piece
    
    def initialize(color, board, start_pos)
        @symbol = :P
        super
    end

    def at_start_row?
        (self.color == :white && self.pos[0] == 1) || (self.color == :black && self.pos[0] == 6)
    end

    def forward_dir
        self.color == :white ? 1 : -1
    end

    def forward_steps
        return [1, 2] if self.at_start_row?
        [1]
    end

    def moves
        moves = []
        self.forward_steps.each do |step|
            dy = step * self.forward_dir
            new_pos = [self.pos[0], self.pos[1] + dy]
            break if !self.valid_move?(new_pos) || board[new_pos] != NullPiece.instance
            moves << new_pos
        end
        moves
    end
end