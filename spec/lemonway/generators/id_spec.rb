# frozen_string_literal: true

describe LemonWay::Generators::Id do
  describe '.generate' do
    it 'generates a string' do
      expect(described_class.generate).to be_a(String)
    end

    it 'is 20 characters length' do
      expect(described_class.generate.length).to eq(20)
    end

    it 'contains only integer' do
      expect(described_class.generate).to match(/\A[-+]?\d+\z/)
    end
  end
end
