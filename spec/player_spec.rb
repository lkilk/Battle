require 'player'

describe Player do
  subject(:liam) { Player.new("Liam") }
  subject(:jay) { Player.new("Jay") }

  describe '#name' do
    it 'returns player name' do
      expect(jay.name).to eq("Jay")
    end
  end

  describe '#hit_points' do
  it 'returns the hit points' do
    expect(jay.hit_points).to eq described_class::DEFAULT_HIT_POINTS
  end
end

describe '#receive_damage' do
  it 'reduces the player hit points' do
    expect { jay.receive_damage }.to change { jay.hit_points }.by(-10)
  end
end

end
