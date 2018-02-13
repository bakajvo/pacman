require_relative '../../../lib/pacman/components/component'

describe 'Component' do
  let(:component) { Pacman::Component.new }

  describe '.new' do
    it 'should return new win component' do
      expect(component).to be_an_instance_of Pacman::Component
    end
  end

  describe 'has a component method' do
    it 'update' do
      expect(component).to respond_to(:update)
      expect { component.update }.to raise_error NotImplementedError
    end
    it 'draw' do
      expect(component).to respond_to(:draw)
      expect { component.draw }.to raise_error NotImplementedError
    end
  end

end