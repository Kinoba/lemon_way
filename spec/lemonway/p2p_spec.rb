# frozen_string_literal: true

describe LemonWay::P2P do
  before { set_lemonway_configuration }

  describe '#send_payment' do
    it 'calls the send request method with the send payment parameters' do
      expect(LemonWay.client).to \
        receive(:send_request)
        .with('SendPayment', '1.0', debitWallet: 'wallet_id', creditWallet: '123', amount: '15.00')
      described_class.send_payment(debitWallet: 'wallet_id', creditWallet: '123', amount: '15.00')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('SendPayment') }

      it 'raises the lemon way error' do
        expect { described_class.send_payment }.to raise_error(LemonWay::LemonWayError)
      end
    end
  end

  describe '#get_payment_details' do
    it 'calls the send request method with the get payment details parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('GetPaymentDetails', '1.0', transactionId: 'transactionId')
      described_class.get_payment_details(transactionId: 'transactionId')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('GetPaymentDetails') }

      it 'raises the lemon way error' do
        expect { described_class.get_payment_details }.to raise_error(LemonWay::LemonWayError)
      end
    end
  end
end
