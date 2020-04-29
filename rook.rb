require_relative 'piece'

class Rook < Piece
    include Slideable

    def initialize(color, board, start_pos)
        @symbol = :R
        super
    end

    def move_dirs
        [:horizontal]
    end
end

if $RROGRAM_NAME == __FILE__
    r = Rook.new('', '', [0,1])
    print r.moves
end