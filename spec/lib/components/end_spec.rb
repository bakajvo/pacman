require_relative '../../../lib/pacman/components/end'

describe 'End component' do
  let(:end_comp) { Pacman::End.new(100) }

  describe '.new' do
    it 'should return new win component' do
      expect(end_comp).to be_an_instance_of Pacman::End
      expect(end_comp.class.superclass).to be Pacman::Component
    end

    it 'should store game score' do
      expect(end_comp.score).to be 100
    end
  end

  describe 'has a component method' do
    it 'update' do
      expect(end_comp).to respond_to(:update)
    end
    it 'draw' do
      expect(end_comp).to respond_to(:draw)
    end
  end

end