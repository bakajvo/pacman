# module pacman
module Pacman
  MAP_SPRITES = [54, 55, 40, 41].freeze
  PACMAN_LEFT = [38, 39].freeze
  PACMAN_RIGHT = [10, 11].freeze
  PACMAN_UP = [52, 53].freeze
  PACMAN_DOWN = [24, 25].freeze

  LEFT = 1
  RIGHT = 2
  UP = 3
  DOWN = 4
  STAY = 5

  SPEED = 2
  OVERPOWER = 600

  ATTACK = 800
  SCATTER = 400

  PACMAN = 4
  BLINKY = 8
  BLINKY_SPRITES = [0, 1].freeze
  PINKY = 5
  PINKY_SPRITES = [4, 5].freeze
  INKY = 6
  INKY_SPRITES = [6, 7].freeze
  CLYDE = 7
  CLYDE_SPRITES = [2, 3].freeze
  WEAK_GHOSTS = [12, 13].freeze
  DOOR = 3
end
