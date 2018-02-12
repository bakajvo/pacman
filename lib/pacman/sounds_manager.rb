require 'singleton'

module Pacman
  class SoundsManager
    include Singleton

    attr_reader :chomp, :death, :fruit

    def initialize
      @fruit = Gosu::Sample.new('../assets/sounds/pacman_eatfruit.wav')
      @death = Gosu::Sample.new('../assets/sounds/pacman_death.wav')
      @chomp = Gosu::Sample.new('../assets/sounds/pacman_chomp.wav')
    end

  end
end