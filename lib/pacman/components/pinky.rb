require_relative 'component'
require_relative '../sprites_manager'
require_relative '../constants'
require_relative '../helper'
require_relative 'ghost'
require 'matrix'

module Pacman
  class Pinky < Ghost

    def initialize(pacman, map)
      @pacman = pacman
      @map = map
      @sprites = SpritesManager.instance.get_sprites(PINKY_SPRITES)
      @weak_ghost = SpritesManager.instance.get_sprites(WEAK_GHOSTS)
      @pos = @map.spawn(PINKY)
      @ticks = 0
      @vel = Vector[0, 0]
      @last_dir = @dir = STAY
      @last_move = nil
      @speed = SPEED
    end
  end
end