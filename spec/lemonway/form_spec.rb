# frozen_string_literal: true

describe LemonWay::Form do
  before { set_lemonway_configuration }

  describe '#create' do
    it 'calls the send request method with the create payment form parameters' do
      expect(LemonWay.client).to \
        receive(:send_request)
        .with('CreatePaymentForm', '1.0', wallet: 'wallet_id', optId: '123')
      described_class.create(wallet: 'wallet_id', id: '123')
    end

    it 'calls the send request method with the create payment form parameters and automatic id' do
      allow(LemonWay::Generators::Id).to receive(:generate).with(length: 60).and_return('456')
      expect(LemonWay.client).to \
        receive(:send_request).with('CreatePaymentForm', '1.0', wallet: 'wallet_id', optId: '456')
      described_class.create(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('CreatePaymentForm') }

      it 'raises the create payment form error' do
        expect { described_class.create }.to \
          raise_error(LemonWay::Errors::CreatePaymentFormError)
      end
    end
  end

  describe '#get' do
    it 'calls the send request method with the get payment form parameters' do
      expect(LemonWay.client).to \
        receive(:send_request)
        .with('GetCompletedPaymentForm', '1.0', wallet: 'wallet_id', formId: '456')
      described_class.get(wallet: 'wallet_id', id: '456')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('GetCompletedPaymentForm') }

      it 'raises the get payment form error' do
        expect { described_class.get }.to \
          raise_error(LemonWay::Errors::GetCompletedPaymentFormError)
      end
    end
  end

  describe '#disable' do
    it 'calls the send request method with the disable payment form parameters' do
      expect(LemonWay.client).to \
        receive(:send_request)
        .with('DisablePaymentForm', '1.0', wallet: 'wallet_id', formId: '456')
      described_class.disable(wallet: 'wallet_id', id: '456')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('DisablePaymentForm') }

      it 'raises the disable payment form error' do
        expect { described_class.disable }.to \
          raise_error(LemonWay::Errors::DisablePaymentFormError)
      end
    end
  end
end
