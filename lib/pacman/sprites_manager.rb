require 'singleton'

module Pacman
  class SpritesManager
    include Singleton

    TILE_SIZE = 32

    def initialize
      @sprites = Gosu::Image.load_tiles('../assets/images/sprites/pacman.png', TILE_SIZE, TILE_SIZE)
    end

    def get_sprites(what)
      result = []
      what.each { |x| result.push(@sprites[x]) }
      result
    end
  end
end