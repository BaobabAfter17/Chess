require_relative 'piece'

class Knight < Piece

    include Stepable
    attr_reader :symbol

    def initialize(color, board, start_pos)
        @symbol = :N
        super
    end

    def move_diffs
        [
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1],
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2]
        ]
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    # print board.inspect
    piece = Knight.new(:white, board, [0, 0])
    board[[3, 3]] = piece
    piece_1 = Knight.new(:white, board, [0, 0])
    piece_2 = Knight.new(:white, board, [0, 0])
    board[[5, 4]] = piece_1
    board[[2, 1]] = piece_2
    # print board.inspect
    print piece.moves
end