require_relative '../../lib/pacman/sprites_manager'

describe 'Sprites manager' do
  let(:spites_manager) { Pacman::SpritesManager.instance }

  describe '.instance' do
    it 'should return a SpriteManager object' do
      expect(spites_manager).to be_an_instance_of Pacman::SpritesManager
    end

    it 'should be singleton' do
      expect(Pacman::SpritesManager.instance.object_id).to be spites_manager.object_id
    end
  end

  describe '.get_sprites' do
    it 'should return some sprites' do
      indices = [4, 5, 6, 8]
      expect(spites_manager.get_sprites(indices)).to be_an_instance_of Array
      expect(spites_manager.get_sprites(indices).length).to be indices.length
      expect(spites_manager.get_sprites(indices)[0]).to be_an_instance_of Gosu::Image
    end
  end
end