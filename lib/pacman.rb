require_relative 'pacman/version'
require_relative 'pacman/game'

# pacman module
module Pacman
  def self.init
    begin
      window = Pacman::Game.new
      window.show
    rescue Interrupt => e
      puts "\r Something goes wrong! :( #{e}"
    end
  end
end
