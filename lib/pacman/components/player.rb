require_relative 'component'
require_relative '../sprites_manager'
require_relative '../constants'
require 'matrix'

module Pacman
  class Player < Component

    SPEED = 2.0

    def initialize(map)
      @map = map
      @animation_left = SpritesManager.instance.get_sprites(PACMAN_LEFT)
      @animation_right = SpritesManager.instance.get_sprites(PACMAN_RIGHT)
      @animation_up = SpritesManager.instance.get_sprites(PACMAN_UP)
      @animation_down = SpritesManager.instance.get_sprites(PACMAN_DOWN)
      @pos = @map.spawn
      @vel = Vector[0, 0]
    end

    def turn_left
      @vel = Vector[-SPEED, 0]
    end

    def turn_right
      @vel = Vector[SPEED, 0]
    end

    def turn_up
      @vel = Vector[0, -SPEED]
    end

    def turn_down
      @vel = Vector[0, SPEED]
    end

    def update
      @pos += @vel
    end

    def draw
      @animation_left[0].draw(@pos[0], @pos[1], 0)
    end

  end
end