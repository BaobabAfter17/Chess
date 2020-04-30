require 'piece'

class King < Piece
    include Stepable

    def initialize(color, board, start_pos)
        @symbol = :K
        super
    end

    def move_diffs
        [
        [1, 0],
        [1, -1],
        [0, -1],
        [-1, -1]
        [-1, 0],
        [-1, 1],
        [0, 1],
        [1, 1]
        ]
    end
end