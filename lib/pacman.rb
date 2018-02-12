require "pacman/version"
require "pacman/game"

module Pacman
  def self.init
    begin
      Pacman::Game.new
    rescue Interrupt => e
      puts "\r Something goes wrong! :( #{e}"
    end
  end
end
