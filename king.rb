require_relative 'piece'

class King < Piece
    include Stepable
    attr_reader :symbol

    def initialize(color, board, start_pos)
        @symbol = :K
        super
    end

    def move_diffs
        [
        [1, 0],
        [1, -1],
        [0, -1],
        [-1, -1],
        [-1, 0],
        [-1, 1],
        [0, 1],
        [1, 1]
        ]
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    # print board.inspect
    piece = King.new(:white, board, [0, 0])
    board[[3, 3]] = piece
    piece_1 = King.new(:white, board, [0, 0])
    piece_2 = King.new(:white, board, [0, 0])
    board[[4, 4]] = piece_1
    board[[2, 2]] = piece_2
    # print board.inspect
    print piece.moves
end