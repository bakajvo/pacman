require_relative 'component'
require_relative '../sprites_manager'
require_relative '../constants'
require_relative '../helper'
require_relative 'ghost'
require 'matrix'

module Pacman
  # class Inky
  class Inky < Ghost
    def initialize(pacman, map)
      @pacman = pacman
      @map = map
      @sprites = SpritesManager.instance.get_sprites(INKY_SPRITES)
      @weak_ghost = SpritesManager.instance.get_sprites(WEAK_GHOSTS)
      @pos = @spawn = @map.spawn(INKY)
      @ticks = 0
      @vel = Vector[0, 0]
      @last_dir = @dir = STAY
      @last_move = nil
      @speed = SPEED
    end

    def select_direction(possible)
      attack(possible)
    end
  end
end
