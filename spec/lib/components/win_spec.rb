require_relative '../../../lib/pacman/components/win'

describe 'Win component' do
  let(:win) { Pacman::Win.new }

  describe '.new' do
    it 'should return new win component' do
      expect(win).to be_an_instance_of Pacman::Win
      expect(win.class.superclass).to be Pacman::Component
    end
  end

  describe 'has a component method' do
    it 'update' do
      expect(win).to respond_to(:update)
    end
    it 'draw' do
      expect(win).to respond_to(:draw)
    end
  end
end