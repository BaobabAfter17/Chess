require_relative 'piece'

class Queen < Piece
    include Slideable

    def initialize(color, board, start_pos)
        @symbol = :Q
        super
    end

    def move_dirs
        [:horizontal, :diagonal]
    end
end

if $RROGRAM_NAME == __FILE__
    q = Queen.new('', '', [0,1])
    print q.moves
end