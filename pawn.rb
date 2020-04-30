require_relative 'piece'

class Pawn < Piece
    attr_reader :symbol

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
            dx = step * self.forward_dir
            new_pos = [self.pos[0] + dx, self.pos[1]]
            break if !self.valid_move?(new_pos) || board[new_pos] != NullPiece.instance
            moves << new_pos
        end
        moves
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    # print board.inspect
    piece = Pawn.new(:black, board, [0, 0])
    board[[1, 3]] = piece
    # piece_1 = Pawn.new(:white, board, [0, 0])
    # piece_2 = Pawn.new(:white, board, [0, 0])
    # board[[1, 4]] = piece_1
    # board[[2, 1]] = piece_2
    # print board.inspect
    print piece.moves
end