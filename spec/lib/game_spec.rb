require_relative '../../lib/pacman/game'

describe 'Game' do
  describe '.new' do
    it 'should return a Game object' do
      expect(Pacman::Game.new).to be_an_instance_of Pacman::Game
      expect(Pacman::Game.new).to be_an_instance_of Gosu::Window
    end
  end

end