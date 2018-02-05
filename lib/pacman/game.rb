require 'gosu'

module Pacman

  class Game < Gosu::Window
    def initialize
      super 640, 480
      self.caption = 'Pacman'

      @background_image = Gosu::Image.new('../assets/images/sprites/pacman.png', :tileable => true)
    end

    def update
      # todo
    end

    def draw
      @background_image.draw(0, 0, 0)
    end
  end

end

window = Pacman::Game.new
window.show