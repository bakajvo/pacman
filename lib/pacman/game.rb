require 'gosu'
require_relative 'components/tiles'
require_relative 'components/player'
require_relative 'components/blinky'

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
      @components << Blinky.new(@components[1], @components[0])
    end

    def update
      @components.each(&:update)
    end

    def draw
      @components.each(&:draw)
    end
  end
end

window = Pacman::Game.new
window.show
