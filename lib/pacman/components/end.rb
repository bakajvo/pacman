require_relative 'component'

module Pacman
  class End < Component

    attr_reader :score

    def initialize(score)
      @score = score
      @font = Gosu::Font.new(40)
    end

    def update
      #empty
    end

    def draw
      @font.draw("Score: #{@score}", 100, 200, 1, 1.0, 1.0, Gosu::Color::WHITE)
    end

  end
end
