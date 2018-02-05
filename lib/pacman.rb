require "pacman/version"
require "pacman/game"

module Pacman
  def self.init
    begin
      $game = Pacman::Game.new
      $game.begin!
    rescue Interrupt => e
      puts "\r Something goes wrong! :("
    end
  end
end
