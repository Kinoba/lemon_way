# frozen_string_literal: true

describe LemonWay::Wallet do
  before { set_lemonway_configuration }

  describe '#get' do
    it 'calls the send request method with the get wallet details parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('GetWalletDetails', '2.0', wallet: 'wallet_id')
      described_class.get(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('GetWalletDetails') }

      it 'raises the get wallet details error' do
        expect { described_class.get }.to \
          raise_error(LemonWay::Errors::GetWalletDetailsError)
      end
    end
  end

  describe '#register' do
    it 'calls the send request method with the register wallet parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('RegisterWallet', '1.1', wallet: 'wallet_id')
      described_class.register(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('RegisterWallet') }

      it 'raises the register wallet error' do
        expect { described_class.register }.to raise_error(LemonWay::Errors::RegisterWalletError)
      end
    end
  end

  describe '#update' do
    it 'calls the send request method with the update wallet details parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('UpdateWalletDetails', '1.0', wallet: 'wallet_id')
      described_class.update(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('UpdateWalletDetails') }

      it 'raises the update wallet details error' do
        expect { described_class.update }.to \
          raise_error(LemonWay::Errors::UpdateWalletDetailsError)
      end
    end
  end

  describe '#update_status' do
    it 'calls the send request method with the update wallet details parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('UpdateWalletStatus', '1.0', wallet: 'wallet_id')
      described_class.update_status(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('UpdateWalletStatus') }

      it 'raises the update status error' do
        expect { described_class.update_status }.to \
          raise_error(LemonWay::Errors::UpdateWalletStatusError)
      end
    end
  end

  describe '#upload_file' do
    it 'calls the send request method with the upload file parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('UploadFile', '1.1', wallet: 'wallet_id')
      described_class.upload_file(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('UploadFile') }

      it 'raises the upload file error' do
        expect { described_class.upload_file }.to raise_error(LemonWay::Errors::UploadFileError)
      end
    end
  end

  describe '#transactions_history' do
    it 'calls the send request method with the upload file parameters' do
      expect(LemonWay.client).to \
        receive(:send_request).with('GetWalletTransHistory', '2.1', wallet: 'wallet_id')
      described_class.transactions_history(wallet: 'wallet_id')
    end

    context 'with wrong parameters' do
      before { stub_error_lemonway_request('GetWalletTransHistory') }

      it 'raises the upload file error' do
        expect { described_class.transactions_history }.to \
          raise_error(LemonWay::Errors::GetWalletTransHistoryError)
      end
    end
  end
end
