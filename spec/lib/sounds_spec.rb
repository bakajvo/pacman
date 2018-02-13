require_relative '../../lib/pacman/sounds_manager'

describe 'Sounds manager' do
  let(:sounds_manager) { Pacman::SoundsManager.instance }

  describe '.instance' do
    it 'should return a SoundManager object' do
      expect(sounds_manager).to be_an_instance_of Pacman::SoundsManager
    end

    it 'should be singleton' do
      expect(Pacman::SoundsManager.instance.object_id).to be sounds_manager.object_id
    end
  end

  describe 'has some sounds' do
    it 'should return some sounds' do
      expect(sounds_manager.chomp).to be_instance_of Gosu::Sample
      expect(sounds_manager.death).to be_instance_of Gosu::Sample
      expect(sounds_manager.fruit).to be_instance_of Gosu::Sample
    end
  end
end