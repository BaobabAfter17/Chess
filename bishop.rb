require_relative 'piece'

class Bishop < Piece
    include Slideable

    def initialize(color, board, start_pos)
        @symbol = :B
        super
    end

    def move_dirs
        [:diagonal]
    end
end

if $RROGRAM_NAME == __FILE__
    b = Bishop.new('', '', [0,1])
    print b.moves
end