require 'singleton'

module Pacman
  # class SpriteManager
  class SpritesManager
    include Singleton

    TILE_SIZE = 32
    ROOT = File.dirname(File.dirname(__FILE__)) + '/../assets'

    def initialize
      @sprites = Gosu::Image.load_tiles(ROOT + '/images/sprites/pacman.png', TILE_SIZE, TILE_SIZE)
    end

    def get_sprites(what)
      result = []
      what.each { |x| result.push(@sprites[x]) }
      result
    end
  end
end
