# frozen_string_literal: true

describe LemonWay::MoneyIn do
  before { set_lemonway_configuration }

  describe '#init' do
    it 'calls the send request method with the money in web init parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('MoneyInWebInit', '1.3', wallet: 'wallet_id')
      described_class.init(id: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('MoneyInWebInit') }

      it 'raises the money in web init error' do
        expect { described_class.init }.to \
          raise_error(LemonWay::Errors::MoneyInWebInitError)
      end
    end
  end

  describe '#validate' do
    it 'calls the send request method with the money in validate parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('MoneyInValidate', '1.0', transactionId: 'wallet_id')
      described_class.validate(id: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('MoneyInValidate') }

      it 'raises the money in validate error' do
        expect { described_class.validate }.to \
          raise_error(LemonWay::Errors::MoneyInValidateError)
      end
    end
  end
end
