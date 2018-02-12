require_relative 'component'
require_relative '../sprites_manager'
require_relative '../constants'
require_relative '../helper'
require_relative 'ghost'
require 'matrix'

module Pacman
  class Blinky < Ghost

    def initialize(pacman, map)
      @pacman = pacman
      @map = map
      @sprites = SpritesManager.instance.get_sprites(BLINKY_SPRITES)
      @weak_ghost = SpritesManager.instance.get_sprites(WEAK_GHOSTS)
      @pos = @spawn = @map.spawn(BLINKY)
      @ticks = 0
      @vel = Vector[0, 0]
      @last_dir = @dir = STAY
      @last_move = nil
      @speed = SPEED
      @combat = 0
    end

    def update
      @combat += 1
      choose_move
      @pos += @vel
      check_events
      @combat %= ATTACK + SCATTER
    end

    def select_direction(possible)
      @combat < ATTACK ? attack(possible) : random(possible)
    end
  end
end
