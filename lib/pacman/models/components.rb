class Component
  def load
    raise NotImplementedError, 'You must implement the load method'
  end

  def update
    raise NotImplementedError, 'You must implement the update method'
  end

  def draw
    raise NotImplementedError, 'You must implement the draw method'
  end
end