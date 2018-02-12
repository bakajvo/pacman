require_relative 'component'
require_relative '../sprites_manager'
require_relative '../constants'
require_relative '../helper'
require 'matrix'

module Pacman
  class Ghost < Component

    MOVES = %i[turn_left turn_right turn_up turn_down].freeze

    def initialize(pacman, map)
      @pacman = pacman
      @map = map
      @sprites = nil
      @weak_ghost = nil
      @pos = nil
      @ticks = 0
      @vel = Vector[0, 0]
      @last_dir = @dir = STAY
      @last_move = nil
      @speed = SPEED
    end

    def draw
      index = (@ticks / 10).to_i
      if @pacman.overpower.zero?
        @sprites[index].draw(@pos[0], @pos[1], 0)
      else
        @weak_ghost[index].draw(@pos[0], @pos[1], 0)
      end
      @ticks += 1
      @ticks %= 20
    end

    def update
      choose_move
      @pos += @vel
      check_events
    end

    def check_events
      @pacman.die if check_die(@pos, @pacman.pos)
      @speed = @pacman.overpower.zero? ? fix_position : 1
    end

    def fix_position
      unless @pos[0].even?
        @pos += @last_move == :turn_left ? Vector[1, 0] : Vector[-1, 0]
      end
      unless @pos[1].even?
        @pos += @last_move == :turn_down ? Vector[0, 1] : Vector[0, -1]
      end
      SPEED
    end

    def check_die(a, b)
      r = a - b
      return true if r[0].abs < 5 && r[1].abs < 5
      false
    end

    def choose_move
      result = []
      MOVES.each do |x|
        method(x).call
        next_move = @pos + @vel
        result << x if Helper.available_move?(next_move, @dir, @map)
      end
      result.delete @last_move if result.length > 1
      res = select_direction(result)
      update_last_move(res)
      method(res).call
    end

    def select_direction(possible)
      random(possible)
    end

    def update_last_move(move)
      @last_move = :turn_down if move == :turn_up
      @last_move = :turn_up if move == :turn_down
      @last_move = :turn_right if move == :turn_left
      @last_move = :turn_left if move == :turn_right
    end

    def turn_left
      @dir = LEFT
      @vel = Vector[-@speed, 0]
    end

    def turn_right
      @dir = RIGHT
      @vel = Vector[@speed, 0]
    end

    def turn_up
      @dir = UP
      @vel = Vector[0, -@speed]
    end

    def turn_down
      @dir = DOWN
      @vel = Vector[0, @speed]
    end

    def random(possible)
      possible.sample
    end

    def attack(possible)
      return possible[0] if possible.length == 1
      min = possible[0]
      possible.each do |x|
        min = x if distance(calc_position(x), @pacman.pos) < distance(calc_position(min), @pacman.pos)
      end
      min
    end

    def distance(a, b)
      x = a[0] - b[0]
      y = a[1] - b[1]
      Math.sqrt(x * x + y * y)
    end

    def calc_position(dir)
      pos = @pos
      pos += Vector[48, 16] if dir == :turn_right
      pos += Vector[-16, 16] if dir == :turn_left
      pos += Vector[16, -16] if dir == :turn_top
      pos += Vector[16, 48] if dir == :turn_down
      pos
    end
  end
end
