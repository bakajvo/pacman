require 'gosu'
require_relative 'components/tiles'
require_relative 'components/player'
require_relative 'components/pinky'
require_relative 'components/inky'
require_relative 'components/clyde'
require_relative 'components/blinky'
require_relative 'components/end'
require_relative 'components/win'

module Pacman
  class Game < Gosu::Window
    def initialize
      @components = []
      load_components

      super @components[0].width, @components[0].height
      self.caption = 'Pacman'
    end

    def load_components
      @components << Tiles.new
      @components << Player.new(@components[0])
      @components << Pinky.new(@components[1], @components[0])
      @components << Inky.new(@components[1], @components[0])
      @components << Clyde.new(@components[1], @components[0])
      @components << Blinky.new(@components[1], @components[0])
    end

    def update
      @components.each(&:update)
      if @components.length > 1 && !@components[1].alive
        score = @components[1].score
        @components = []
        @components << End.new(score)
      elsif @components.length > 1 && @components[1].score == @components[0].points
        @components = []
        @components << Win.new
      end
    end

    def draw
      @components.each(&:draw)
    end
  end
end

window = Pacman::Game.new
window.show
