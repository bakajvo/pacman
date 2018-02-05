require 'gosu'
require_relative 'models/tiles'

module Pacman

  class Game < Gosu::Window
    def initialize
      @components = []
      load_components
      load_content

      super @components[0].width, @components[0].height
      self.caption = 'Pacman'
    end

    def load_components
      @components << Tiles.new
    end

    def load_content
      @components.each(&:load)
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