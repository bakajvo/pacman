require_relative 'component'

module Pacman
  # Win class
  class Win < Component
    def initialize
      @font = Gosu::Font.new(40)
    end

    def update
      # empty
    end

    def draw
      @font.draw('You are winner', 100, 200, 1, 1.0, 1.0, Gosu::Color::WHITE)
    end
  end
end
