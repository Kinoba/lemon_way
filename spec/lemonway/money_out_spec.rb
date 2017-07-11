# frozen_string_literal: true

describe LemonWay::MoneyOut do
  before { set_lemonway_configuration }

  describe '#register_iban' do
    it 'calls the send request method with the register iban parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('RegisterIBAN', '1.1', wallet: 'wallet_id')
      described_class.register_iban(id: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('RegisterIBAN') }

      it 'raises the register iban error' do
        expect { described_class.register_iban }.to \
          raise_error(LemonWay::LemonWayError)
      end
    end
  end

  describe '#transfer' do
    it 'calls the send request method with the transfer parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('MoneyOut', '1.3', wallet: 'wallet_id')
      described_class.transfer(id: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('MoneyOut') }

      it 'raises the transfer error' do
        expect { described_class.transfer }.to \
          raise_error(LemonWay::LemonWayError)
      end
    end
  end

  describe '#transfer_details' do
    it 'calls the send request method with the transfer details parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('GetMoneyOutTransDetails', '1.4', wallet: 'wallet_id')
      described_class.transfer_details(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('GetMoneyOutTransDetails') }

      it 'raises the transfer details error' do
        expect { described_class.transfer_details }.to \
          raise_error(LemonWay::LemonWayError)
      end
    end
  end
end
