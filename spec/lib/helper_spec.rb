require_relative '../../lib/pacman/helper'
require_relative '../../lib/pacman/components/tiles'
require_relative '../../lib/pacman/constants'

describe 'Helper' do
  let(:map) { Pacman::Tiles.new }

  describe 'test available_move?' do
    it 'basic test' do
      expect(Pacman::Helper.available_move?(Vector[64, 32], Pacman::RIGHT, map)).to be true
      expect(Pacman::Helper.available_move?(Vector[64, 33], Pacman::DOWN, map)).to be true
      expect(Pacman::Helper.available_move?(Vector[64, 31], Pacman::UP, map)).to be false
      expect(Pacman::Helper.available_move?(Vector[63, 32], Pacman::LEFT, map)).to be false
    end

    it 'advanced test' do
      expect(Pacman::Helper.available_move?(Vector[64, 32], Pacman::STAY, map)).to be true
      expect(Pacman::Helper.available_move?(Vector[64, 50], Pacman::LEFT, map)).to be true
      expect(Pacman::Helper.available_move?(Vector[250, 50], Pacman::LEFT, map)).to be false
    end
  end

  describe 'test last_move' do
    it 'should return vector' do
      expect(Pacman::Helper.last_move(Pacman::RIGHT)).to be_an_instance_of Vector
    end

    it 'should return velocity vector' do
      expect(Pacman::Helper.last_move(Pacman::RIGHT)).eql? Vector[Pacman::SPEED, 0]
      expect(Pacman::Helper.last_move(Pacman::LEFT)). eql? Vector[-Pacman::SPEED, 0]
      expect(Pacman::Helper.last_move(Pacman::UP)).eql? Vector[0, -Pacman::SPEED]
      expect(Pacman::Helper.last_move(Pacman::DOWN)).eql? Vector[0, Pacman::SPEED]
    end

    it 'if direction does not exists stay' do
      expect(Pacman::Helper.last_move(456)).eql? Vector[0, 0]
    end
  end
end