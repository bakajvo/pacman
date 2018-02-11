require 'gosu'
require_relative 'components/tiles'
require_relative 'components/player'

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
    end

    def update
      if Gosu.button_down?(Gosu::KbLeft) || Gosu.button_down?(Gosu::GpLeft)
        @components[1].turn_left
      end
      if Gosu.button_down?(Gosu::KbRight) || Gosu.button_down?(Gosu::GpRight)
        @components[1].turn_right
      end
      if Gosu.button_down?(Gosu::KbUp) || Gosu.button_down?(Gosu::KbUp)
        @components[1].turn_up
      end
      if Gosu.button_down?(Gosu::KbDown) || Gosu.button_down?(Gosu::KbDown)
        @components[1].turn_down
      end
      @components.each(&:update)
    end

    def draw
      @components.each(&:draw)
    end
  end
end

window = Pacman::Game.new
window.show
