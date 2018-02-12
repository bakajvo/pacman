require_relative '../spec_helper'

describe 'Game' do
  describe '.new' do
    it 'returns a Game object' do
      expect(Game.new).to be_an_instance_of Game
      expect(Game.new).to be_an_instance_of Gosu::Window
    end
  end
end