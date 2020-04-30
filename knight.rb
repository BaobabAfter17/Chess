require 'piece'

class Knight < Piece

    include Stepable

    def initialize(color, board, start_pos)
        @symbol = :N
        super
    end

    def move_diffs
        [
        [2, 1],
        [2, -1],
        [-2, 1],
        [-2, -1]
        [1, 2],
        [1, -2],
        [-1, 2],
        [-1, -2]
        ]
    end
end