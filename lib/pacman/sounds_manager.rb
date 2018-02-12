require 'singleton'

module Pacman
  class SoundsManager
    include Singleton

    ROOT = File.dirname(File.dirname(__FILE__)) + '/../assets'

    attr_reader :chomp, :death, :fruit

    def initialize
      @fruit = Gosu::Sample.new(ROOT + '/sounds/pacman_eatfruit.wav')
      @death = Gosu::Sample.new(ROOT + '/sounds/pacman_death.wav')
      @chomp = Gosu::Sample.new(ROOT + '/sounds/pacman_chomp.wav')
    end

  end
end