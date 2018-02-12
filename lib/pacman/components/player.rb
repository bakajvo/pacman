require_relative 'component'
require_relative '../sprites_manager'
require_relative '../sounds_manager'
require_relative '../constants'
require_relative '../helper'
require 'matrix'

module Pacman
  class Player < Component

    attr_reader :pos, :alive, :overpower, :score

    def initialize(map)
      @map = map
      @animation_left = SpritesManager.instance.get_sprites(PACMAN_LEFT)
      @animation_right = SpritesManager.instance.get_sprites(PACMAN_RIGHT)
      @animation_up = SpritesManager.instance.get_sprites(PACMAN_UP)
      @animation_down = SpritesManager.instance.get_sprites(PACMAN_DOWN)
      @pos = @map.spawn(PACMAN)
      @vel = Vector[0, 0]
      @last_dir = @dir = STAY
      @ticks = 0
      @alive = true
      @overpower = 0
      @score = 0
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

    def update
      read_input
      next_move = @pos + @vel
      if Helper.available_move?(next_move, @dir, @map)
        @last_dir = @dir
        @pos = next_move
      else
        next_move = @pos + Helper.last_move(@last_dir)
        @pos = next_move if Helper.available_move?(next_move, @last_dir, @map)
      end
      check_events
      @overpower -= 1 unless @overpower.zero?
    end

    def draw
      index = (@ticks / 10).to_i
      case @last_dir
        when RIGHT
          @animation_right[index].draw(@pos[0], @pos[1], 0)
        when LEFT
          @animation_left[index].draw(@pos[0], @pos[1], 0)
        when UP
          @animation_up[index].draw(@pos[0], @pos[1], 0)
        when DOWN
          @animation_down[index].draw(@pos[0], @pos[1], 0)
        else
          @animation_right[0].draw(@pos[0], @pos[1], 0)
      end

      @ticks += 1
      @ticks %= 20
    end

    def check_events
      x = @pos[0] / 32
      y = @pos[1] / 32
      if (@pos[0] % 32).zero? && (@pos[1] % 32).zero?
        if @map.map[y][x].zero?
          @map.clear_tile(x, y)
          eat_point
        elsif @map.map[y][x] == 2
          @map.clear_tile(x, y)
          set_overpower
        end
      end
    end

    def read_input
      turn_left if Gosu.button_down?(Gosu::KbLeft) || Gosu.button_down?(Gosu::GpLeft)
      turn_right if Gosu.button_down?(Gosu::KbRight) || Gosu.button_down?(Gosu::GpRight)
      turn_up if Gosu.button_down?(Gosu::KbUp) || Gosu.button_down?(Gosu::KbUp)
      turn_down if Gosu.button_down?(Gosu::KbDown) || Gosu.button_down?(Gosu::KbDown)
    end

    def eat_point
      SoundsManager.instance.chomp.play
      @score += 1
    end

    def set_overpower
      SoundsManager.instance.fruit.play
      @overpower = OVERPOWER
    end

    def die
      if @overpower.zero?
        SoundsManager.instance.death.play
        @alive = false
      end
    end

  end
end
