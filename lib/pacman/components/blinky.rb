require_relative 'component'
require_relative '../sprites_manager'
require_relative '../constants'
require_relative '../helper'
require 'matrix'

module Pacman
  class Blinky < Component

    MOVES = %i[turn_left turn_right turn_up turn_down].freeze

    def initialize(pacman, map)
      @pacman = pacman
      @map = map
      @sprites = SpritesManager.instance.get_sprites(BLINKY_SPRITES)
      @pos = @map.spawn(BLINKY)
      @ticks = 0
      @vel = Vector[0, 0]
      @last_dir = @dir = STAY
      @last_move = nil
    end

    def draw
      index = (@ticks / 10).to_i
      @sprites[index].draw(@pos[0], @pos[1], 0)
      @ticks += 1
      @ticks %= 20
    end

    def update
      choose_random_move
      @pos += @vel
    end

    def choose_random_move
      result = []
      MOVES.each do |x|
        meth = method(x)
        meth.call
        next_move = @pos + @vel
        result << x if Helper.available_move?(next_move, @dir, @map)
      end
      result.delete @last_move
      res = result.sample
      update_last_move(res)
      tmp = method(res)
      tmp.call
    end

    def update_last_move(move)
      @last_move = :turn_down if move == :turn_up
      @last_move = :turn_up if move == :turn_down
      @last_move = :turn_right if move == :turn_left
      @last_move = :turn_left if move == :turn_right
    end

    def turn_left
      @dir = LEFT
      @vel = Vector[-SPEED, 0]
    end

    def turn_right
      @dir = RIGHT
      @vel = Vector[SPEED, 0]
    end

    def turn_up
      @dir = UP
      @vel = Vector[0, -SPEED]
    end

    def turn_down
      @dir = DOWN
      @vel = Vector[0, SPEED]
    end

  end
end
