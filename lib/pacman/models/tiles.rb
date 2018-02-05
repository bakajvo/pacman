require_relative 'component'

class Tiles < Component

  TILE_SIZE = 16

  def initialize
    @tiles = Gosu::Image.load_tiles('../assets/images/sprites/tiles.png', TILE_SIZE, TILE_SIZE)
    @file = File.open('../assets/map/01.map')
    @map = []
    @width = 0
    @height = 0
  end

  def load
    @file.each_line do |line|
      @map.push(line.delete("\n").split('').map(&:to_i))
    end
    @height = @map.length
    @width = @map[0].length
  end

  def update
    # no updates
  end

  def draw
    (0..@height - 1).each do |y|
      (0..@width - 1).each do |x|
        @tiles[@map[y][x]].draw(x * TILE_SIZE, y * TILE_SIZE, 0)
      end
    end
  end

  def width
    @width * TILE_SIZE
  end

  def height
    @height * TILE_SIZE
  end
end
