require 'singleton'

class NullPiece
    
    inlcude Singleton
    attr_reader :color, :symbol

    def initialize
        @color = nil
        @symbol = :NP
    end
end