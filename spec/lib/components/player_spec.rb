require_relative '../../../lib/pacman/components/player'
require_relative '../../../lib/pacman/components/tiles'
require_relative '../../../lib/pacman/constants'

describe 'Pacman component' do
  let(:map) { Pacman::Tiles.new }
  let(:pacman) { Pacman::Player.new(map) }

  describe '.new' do
    it 'should return new win component' do
      expect(pacman).to be_an_instance_of Pacman::Player
      expect(pacman.class.superclass).to be Pacman::Component
    end
  end

  describe 'has a component method' do
    it 'update' do
      expect(pacman).to respond_to(:update)
    end
    it 'draw' do
      expect(pacman).to respond_to(:draw)
    end
  end

  describe 'control pacman' do
    it 'on start pacman staying on start position' do
      expect(pacman.dir).to eq Pacman::STAY
    end

    it 'should has control method' do
      pacman.turn_right
      expect(pacman.dir).to eq Pacman::RIGHT
      pacman.turn_left
      expect(pacman.dir).to eq Pacman::LEFT
      pacman.turn_up
      expect(pacman.dir).to eq Pacman::UP
      pacman.turn_down
      expect(pacman.dir).to eq Pacman::DOWN
    end
  end

  describe 'test events' do
    it 'should eat points' do
      pacman.turn_left
      150.times { pacman.update }
      expect(pacman.score).to be 8
    end

    it 'should get overpower when he eats fruits' do
      pacman.turn_left
      150.times { pacman.update }
      pacman.turn_down
      20.times { pacman.update }
      expect(pacman.overpower).not_to be 0
    end
  end

  describe 'die' do
    it 'shout die after he met ghost' do
      expect(pacman.alive).to be true
      pacman.die
      expect(pacman.alive).to be false
    end
  end

end