require_relative 'piece'

class Bishop < Piece
    include Slideable
    attr_reader :symbol
    def initialize(color, board, start_pos)
        @symbol = :B
        super
    end

    def move_dirs
        [:diagonal]
    end
end

if __FILE__ == $PROGRAM_NAME
    board = Board.new
    # print board.inspect
    b = Bishop.new(:white, board, [0, 0])
    board[[3, 3]] = b
    b1 = Bishop.new(:white, board, [0, 0])
    b2 = Bishop.new(:white, board, [0, 0])
    board[[4, 4]] = b1
    board[[2, 2]] = b1
    # print board.inspect
    print b.moves
end