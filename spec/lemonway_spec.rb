# frozen_string_literal: true

describe LemonWay do
  it 'has a version number' do
    expect(LemonWay::VERSION).not_to be nil
  end

  describe '#reset' do
    before { set_lemonway_configuration }

    it 'resets the LemonWay client' do
      LemonWay.reset
      expect { LemonWay.client }.to raise_error(LemonWay::MissingConfigurationError)
    end
  end

  describe '#configuration=' do
    before { set_lemonway_configuration }

    it 'creates the LemonWay client' do
      expect(LemonWay.client).to be_a LemonWay::Client
    end
  end

  describe '#client' do
    subject(:client) { LemonWay.client }

    it 'raises a missing configuration error' do
      expect { client }.to raise_error(LemonWay::MissingConfigurationError)
    end

    context 'when configuration is set' do
      before { set_lemonway_configuration }

      it 'returns the LemonWay client instance' do
        expect(client).to be_a LemonWay::Client
      end
    end
  end
end
