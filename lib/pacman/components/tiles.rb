require_relative 'component'
require_relative '../sprites_manager'
require_relative '../constants'
require 'matrix'

module Pacman
  class Tiles < Component

    TILE_SIZE = 32

    AVAILABLE_TILE = [0, 9, 4, 2].freeze

    attr_reader :map

    def initialize
      @tiles = SpritesManager.instance.get_sprites(MAP_SPRITES)
      @file = File.open('../assets/map/01.map')
      @map = []
      @width = 0
      @height = 0
      load_map
    end

    def load_map
      @file.each_line do |line|
        @map.push(line.delete("\n").split('').map(&:to_i))
      end
      @height = @map.length
      @width = @map[0].length
    end

    def update
      # no updates
    end

    def draw
      (0..@height - 1).each do |y|
        (0..@width - 1).each do |x|
          @tiles[@map[y][x]].draw(x * TILE_SIZE, y * TILE_SIZE, 0) if @map[y][x] < @tiles.length
        end
      end
    end

    def width
      @width * TILE_SIZE
    end

    def height
      @height * TILE_SIZE
    end

    def spawn
      (0..@height - 1).each do |y|
        (0..@width - 1).each do |x|
          return Vector[x * TILE_SIZE, y * TILE_SIZE] if @map[y][x] == 4
        end
      end
      Vector[0, 0]
    end

    def available?(x, y)
      AVAILABLE_TILE.include? @map[y][x]
    end

  end
end