module Pacman
  # Component class
  class Component
    def update
      raise NotImplementedError, 'You must implement the update method'
    end

    def draw
      raise NotImplementedError, 'You must implement the draw method'
    end
  end
end
