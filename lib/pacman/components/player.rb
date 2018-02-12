require_relative 'component'
require_relative '../sprites_manager'
require_relative '../constants'
require 'matrix'

module Pacman
  class Player < Component

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
      if available_move?(next_move, @dir)
        @last_dir = @dir
        @pos = next_move
      else
        next_move = @pos + last_move
        @pos = next_move if available_move?(next_move, @last_dir)
      end
      check_events
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
          overpower
        end
      end
    end

    def last_move
      return Vector[SPEED, 0] if @last_dir == RIGHT
      return Vector[-SPEED, 0] if @last_dir == LEFT
      return Vector[0, -SPEED] if @last_dir == UP
      return Vector[0, SPEED] if @last_dir == DOWN
      Vector[0, 0]
    end

    def available_move?(pos, dir)
      x = (pos[0] / 32).to_i
      xx = ((pos[0] + 31) / 32).to_i
      y = (pos[1] / 32).to_i
      yy = ((pos[1] + 31) / 32).to_i
      case dir
        when RIGHT
          x += 1 unless (pos[0].to_i % 32).to_i.zero?
          return @map.available?(x, y) && @map.available?(x, yy)
        when LEFT
          return (@map.available?(x, y) && @map.available?(x, yy))
        when DOWN
          y += 1 unless (pos[1].to_i % 32).to_i.zero?
          return @map.available?(x, y) && @map.available?(xx, y)
        when UP
          return @map.available?(x, y) && @map.available?(xx, y)
        when STAY
          return true
        else
          return false
      end
    end

    def read_input
      turn_left if Gosu.button_down?(Gosu::KbLeft) || Gosu.button_down?(Gosu::GpLeft)
      turn_right if Gosu.button_down?(Gosu::KbRight) || Gosu.button_down?(Gosu::GpRight)
      turn_up if Gosu.button_down?(Gosu::KbUp) || Gosu.button_down?(Gosu::KbUp)
      turn_down if Gosu.button_down?(Gosu::KbDown) || Gosu.button_down?(Gosu::KbDown)
    end

    def eat_point
      p 'Mnam mnam mnam'
    end

    def overpower
      p 'OVERPOWER'
    end

    def die
      p 'Arghhhhh'
    end

  end
end
