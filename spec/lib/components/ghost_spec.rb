require_relative '../../../lib/pacman/components/ghost'
require_relative '../../../lib/pacman/components/inky'
require_relative '../../../lib/pacman/components/player'
require_relative '../../../lib/pacman/components/tiles'
require_relative '../../../lib/pacman/constants'

describe 'Ghost component' do
  let(:map) { Pacman::Tiles.new }
  let(:pacman) { Pacman::Player.new(map) }
  let(:ghost) { Pacman::Ghost.new(pacman, map) }
  let(:inky) { Pacman::Inky.new(pacman, map) }

  describe '.new' do
    it 'should return new win component' do
      expect(ghost).to be_an_instance_of Pacman::Ghost
      expect(ghost.class.superclass).to be Pacman::Component
    end
  end

  describe 'has a component method' do
    it 'update' do
      expect(ghost).to respond_to(:update)
    end
    it 'draw' do
      expect(ghost).to respond_to(:draw)
    end
  end

  describe 'control ghost' do
    it 'on start ghost staying on start position' do
      expect(ghost.dir).to eq Pacman::STAY
    end

    it 'should has control method' do
      ghost.turn_right
      expect(ghost.dir).to eq Pacman::RIGHT
      ghost.turn_left
      expect(ghost.dir).to eq Pacman::LEFT
      ghost.turn_up
      expect(ghost.dir).to eq Pacman::UP
      ghost.turn_down
      expect(ghost.dir).to eq Pacman::DOWN
    end
  end

  describe '.check if pacman die' do
    it 'pacman should die when he met ghost' do
      expect(ghost.check_die(Vector[10, 20], Vector[10, 20])).to eq true
      expect(ghost.check_die(Vector[10, 20], Vector[7, 24])).to eq true
      expect(ghost.check_die(Vector[10, 20], Vector[5, 24])).to eq false
    end
  end

  describe 'check euclidean distance' do
    it 'test' do
      expect(ghost.distance(Vector[3, 4], Vector[2, 3])).to eq Math.sqrt(2)
    end
  end

  describe 'inky new' do
    it 'should return new win component' do
      expect(inky).to be_an_instance_of Pacman::Inky
      expect(inky.class.superclass).to be Pacman::Ghost
    end
  end

  describe 'inky has a component method' do
    it 'update' do
      expect(inky).to respond_to(:update)
    end
    it 'draw' do
      expect(inky).to respond_to(:draw)
    end
  end

  describe 'inky movement' do
    it 'check ghost position' do
      pos = inky.pos
      10.times { inky.update }
      expect(inky.pos).not_to be pos
    end
  end
end