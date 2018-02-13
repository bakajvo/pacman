require_relative 'constants'
require 'matrix'

module Pacman
  # Helper class
  class Helper
    def self.available_move?(pos, dir, map)
      x = (pos[0] / 32).to_i
      xx = ((pos[0] + 31) / 32).to_i
      y = (pos[1] / 32).to_i
      yy = ((pos[1] + 31) / 32).to_i
      case dir
      when RIGHT
        x += 1 unless (pos[0].to_i % 32).to_i.zero?
        return map.available?(x, y) && map.available?(x, yy)
      when LEFT
        return (map.available?(x, y) && map.available?(x, yy))
      when DOWN
        y += 1 unless (pos[1].to_i % 32).to_i.zero?
        return map.available?(x, y) && map.available?(xx, y)
      when UP
        return map.available?(x, y) && map.available?(xx, y)
      when STAY
        return true
      else
        return false
      end
    end

    def self.last_move(dir)
      return Vector[SPEED, 0] if dir == RIGHT
      return Vector[-SPEED, 0] if dir == LEFT
      return Vector[0, -SPEED] if dir == UP
      return Vector[0, SPEED] if dir == DOWN
      Vector[0, 0]
    end
  end
end
