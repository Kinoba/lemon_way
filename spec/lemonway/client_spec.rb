describe Lemonway::Client do
  describe '#initialize' do
    subject(:client) { described_class.new(options) }
    let(:options) { {} }

    it 'raises a missing configuration error' do
      expect { client }.to raise_error(Lemonway::Errors::MissingConfigurationError)
    end

    context 'without a login parameter' do
      let(:options) { { password: 'Lemon' } }

      it 'raises a missing configuration error' do
        expect { client }.to raise_error(Lemonway::Errors::MissingConfigurationError)
      end
    end

    context 'without a password parameter' do
      let(:options) { { login: 'Lemon' } }

      it 'raises a missing configuration error' do
        expect { client }.to raise_error(Lemonway::Errors::MissingConfigurationError)
      end
    end

    context 'without a company parameter' do
      let(:options) { { login: 'Lemon', password: 'Way' } }

      it 'raises a missing configuration error' do
        expect { client }.to raise_error(Lemonway::Errors::MissingConfigurationError)
      end
    end

    context 'with a login/password/company parameter' do
      let(:options) do
        { login: 'Lemon', password: 'Way', company: 'Lemonway', language: :en, sandbox: true }
      end
        
      it 'sets the Lemonway client login' do
        expect(client.login).to eq 'Lemon'
      end

      it 'sets the Lemonway client password' do
        expect(client.password).to eq 'Way'
      end

      it 'sets the Lemonway client company' do
        expect(client.company).to eq 'Lemonway'
      end

      it 'sets the Lemonway client options' do
        expect(client.options).to eq(language: :en, sandbox: true)
      end
    end
  end

  describe '#send_request' do
    subject(:send_request) { client.send_request('GetWalletDetails', '1.1') }
    let(:client) { described_class.new(options) }
    let(:options) { { login: 'Lemon', password: 'Way', company: 'Lemonway' } }
    let(:returned_body) { { d: { 'WALLET': { lemon: 'way' } } } }

    it 'sends a post request' do
      expect(described_class).to \
        receive(:post).and_return(OpenStruct.new(body: returned_body.to_json))
      send_request
    end

    it 'sends the request with the correct url, headers and body' do
      expect(described_class).to \
        receive(:post).with(
          "#{client.send(:directkit_url)}/GetWalletDetails",
          body: {
            p: {
              wlLogin: 'Lemon',
              wlPass: 'Way',
              language: described_class::DEFAULT_LANGUAGE,
              version: '1.1',
              walletIp: '127.0.0.1',
              walletUa: 'User-agent'
            }
          }.to_json,
          headers: described_class::DEFAULT_HEADERS
        )
        .and_return(OpenStruct.new(body: returned_body.to_json))
      send_request
    end

    context 'with some parameters' do
      subject(:send_request) do
        client.send_request('GetWallet', '2.0', language: 'zh', walletIp: 'test.ip')
      end

      it 'sends the request with the correct url, headers and body' do
        expect(described_class).to \
          receive(:post).with(
            "#{client.send(:directkit_url)}/GetWallet",
            body: {
              p: {
                wlLogin: 'Lemon',
                wlPass: 'Way',
                language: 'zh',
                version: '2.0',
                walletIp: 'test.ip',
                walletUa: 'User-agent'
              }
            }.to_json,
            headers: described_class::DEFAULT_HEADERS
          )
          .and_return(OpenStruct.new(body: returned_body.to_json))
        send_request
      end
    end

    context 'when encountered a response error' do
      let(:returned_body) do
        { 'd' => { 'E' => { 'Code' => '147', 'Msg' => 'test' } } }
      end
      before do
        allow(client).to receive(:perform_request)
          .and_return(OpenStruct.new(body: returned_body.to_json))
      end

      it 'raises the related method error' do
        expect { send_request }.to raise_error(Lemonway::Errors::GetWalletDetailsError)
      end
    end
  end
end