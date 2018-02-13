require_relative '../../lib/pacman/game'

describe 'Game' do
  let(:game) { Pacman::Game.new }

  describe '.new' do
    it 'should return a Game object' do
      expect(game).to be_an_instance_of Pacman::Game
      expect(game.components)
    end

    it 'game should load some components' do
      expect(game).to respond_to(:load_components)
      expect(game.components.length). to be 6
    end

    it 'game has Gosu methods draw/update' do
      expect(game).to respond_to(:draw)
      expect(game).to respond_to(:update)
    end
  end

end