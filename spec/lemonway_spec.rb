describe Lemonway do
  it 'has a version number' do
    expect(Lemonway::VERSION).not_to be nil
  end

  describe '#reset' do
    before { set_lemonway_configuration }

    it 'resets the Lemonway client' do
      Lemonway.reset
      expect { Lemonway.client }.to raise_error(Lemonway::Errors::MissingConfigurationError)
    end
  end

  describe '#configuration=' do
    before { set_lemonway_configuration }

    it 'creates the Lemonway client' do
      expect(Lemonway.client).to be_a Lemonway::Client
    end
  end

  describe '#client' do
    subject(:client) { Lemonway.client }

    it 'raises a missing configuration error' do
      expect { client }.to raise_error(Lemonway::Errors::MissingConfigurationError)
    end

    context 'when configuration is set' do
      before { set_lemonway_configuration }

      it 'returns the Lemonway client instance' do
        expect(client).to be_a Lemonway::Client
      end
    end
  end
end
