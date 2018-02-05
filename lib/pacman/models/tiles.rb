class Tiles < Component
  def load
    @tiles = Gosu::Image.load_tiles('../assets/images/sprites/tiles.png', 16, 16)
  end

  def update
    # no updates
  end

  def draw
    @tiles[0].draw(0, 0, 0)
  end
end
