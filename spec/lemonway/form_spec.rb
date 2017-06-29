describe Lemonway::Form do
  before do
    Lemonway.configuration = { login: 'Login', password: 'Password' }
  end

  describe '#create' do
    it 'calls the send request method with the create payment form parameters' do
      expect(Lemonway.client).to \
        receive(:send_request).with('CreatePaymentForm', '1.0', { wallet: 'wallet_id' })
      described_class.create(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('CreatePaymentForm') }

      it 'raises the create payment form error' do
        expect { described_class.create }.to \
          raise_error(Lemonway::Errors::CreatePaymentFormError)
      end
    end
  end

  describe '#get' do
    it 'calls the send request method with the get payment form parameters' do
      expect(Lemonway.client).to \
        receive(:send_request).with('GetCompletedPaymentForm', '1.0', { wallet: 'wallet_id' })
      described_class.get(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('GetCompletedPaymentForm') }

      it 'raises the get payment form error' do
        expect { described_class.get }.to \
          raise_error(Lemonway::Errors::GetCompletedPaymentFormError)
      end
    end
  end

  describe '#disable' do
    it 'calls the send request method with the disable payment form parameters' do
      expect(Lemonway.client).to \
        receive(:send_request).with('DisablePaymentForm', '1.0', { wallet: 'wallet_id' })
      described_class.disable(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('DisablePaymentForm') }

      it 'raises the disable payment form error' do
        expect { described_class.disable }.to \
          raise_error(Lemonway::Errors::DisablePaymentFormError)
      end
    end
  end
end