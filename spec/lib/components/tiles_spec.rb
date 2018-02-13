require_relative '../../../lib/pacman/components/tiles'
require_relative '../../../lib/pacman/constants'

describe 'Tiles component' do
  let(:tiles) { Pacman::Tiles.new }

  describe '.new' do
    it 'should return new win component' do
      expect(tiles).to be_an_instance_of Pacman::Tiles
      expect(tiles.class.superclass).to be Pacman::Component
    end
  end

  describe 'has a component method' do
    it 'update' do
      expect(tiles).to respond_to(:update)
    end
    it 'draw' do
      expect(tiles).to respond_to(:draw)
    end
  end

  describe '.load_map' do
    it 'map should be not empty' do
      expect(tiles.map).to be_an_instance_of Array
      expect(tiles.map[0]).to be_an_instance_of Array
    end

    it 'map should corresponds with window width/height' do
      expect(tiles.height / 32).to be tiles.map.length
      expect(tiles.width / 32).to be tiles.map[0].length
    end
  end

  describe '.spawn' do
    it 'every objects has some position' do
      expect(tiles.spawn(Pacman::PACMAN)).to be_an_instance_of Vector
      expect(tiles.spawn(Pacman::PACMAN)).eql? Vector[10 * 32, 15 * 32]
    end
  end

  describe 'doors' do
    it 'doors has some position' do
      expect(tiles.spawn(Pacman::DOOR)).to be_an_instance_of Vector
    end

    it 'doors are closed' do
      expect(tiles.map[tiles.door[1] / 32][tiles.door[0] / 32]).to be 3
    end

    it 'doors are open in 5 sc' do
      300.times { tiles.update }
      expect(tiles.map[tiles.door[1] / 32][tiles.door[0] / 32]).to be 9
    end
  end

  describe '.count_points' do
    it 'map should sore max reachable points' do
      expect(tiles.points).to eq 159
    end
  end

  describe '.clear_tile' do
    it 'map should set tile to default tile' do
      expect(tiles.map[0][0]).to eq 1
      tiles.clear_tile(0, 0)
      expect(tiles.map[0][0]).to eq 9
    end
  end

  describe '.available?' do
    it 'map should tell us when tile is reachable' do
      expect(tiles.available?(0, 0)).to eq false
      expect(tiles.available?(2, 2)).to eq true
      expect(tiles.available?(2, 3)).to eq true
      expect(tiles.available?(8, 7)).to eq true
    end
  end
end