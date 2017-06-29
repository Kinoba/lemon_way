describe Lemonway::MoneyIn do
  before { set_lemonway_configuration }

  describe '#money_in_web_init' do
    it 'calls the send request method with the money in web init parameters' do
      expect(Lemonway.client).to \
        receive(:send_request).with('MoneyInWebInit', '1.3', { wallet: 'wallet_id' })
      described_class.money_in_web_init(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('MoneyInWebInit') }

      it 'raises the money in web init error' do
        expect { described_class.money_in_web_init }.to \
          raise_error(Lemonway::Errors::MoneyInWebInitError)
      end
    end
  end

  describe '#get_money_in_trans_details' do
    it 'calls the send request method with the money in transaction details parameters' do
      expect(Lemonway.client).to \
        receive(:send_request).with('GetMoneyInTransDetails', '1.8', { wallet: 'wallet_id' })
      described_class.get_money_in_trans_details(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('GetMoneyInTransDetails') }

      it 'raises the get money in trans details error' do
        expect { described_class.get_money_in_trans_details }.to \
          raise_error(Lemonway::Errors::GetMoneyInTransDetailsError)
      end
    end
  end

  describe '#validate' do
    it 'calls the send request method with the money in validate parameters' do
      expect(Lemonway.client).to \
        receive(:send_request).with('MoneyInValidate', '1.0', { wallet: 'wallet_id' })
      described_class.validate(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('MoneyInValidate') }

      it 'raises the money in validate error' do
        expect { described_class.validate }.to \
          raise_error(Lemonway::Errors::MoneyInValidateError)
      end
    end
  end
end