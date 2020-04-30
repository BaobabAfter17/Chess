require_relative 'piece'

class Queen < Piece
    include Slideable
    attr_reader :symbol

    def initialize(color, board, start_pos)
        @symbol = :Q
        super
    end

    def move_dirs
        [:horizontal, :diagonal]
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    # print board.inspect
    piece = Queen.new(:black, board, [0, 0])
    board[[0, 0]] = piece
    piece_1 = Queen.new(:white, board, [0, 0])
    piece_2 = Queen.new(:white, board, [0, 0])
    board[[1, 0]] = piece_1
    board[[0, 1]] = piece_2
    # print board.inspect
    print piece.moves
end