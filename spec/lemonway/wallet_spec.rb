describe Lemonway::Wallet do
  before do
    Lemonway.configuration = { login: 'Login', password: 'Password' }
  end

  describe '#get' do
    it 'raises the get error if wallet or email parameter is not present' do
      expect { described_class.get }.to \
        raise_error(Lemonway::Errors::GetWalletParameterError)
    end

    it 'raises the get error if parameter is not a hash' do
      expect { described_class.get('wallet_id') }.to \
        raise_error(Lemonway::Errors::GetWalletParameterError)
    end
  end

  describe '#register' do
    it 'raises the register error if parameter is not a hash' do
      expect { described_class.register('wallet_id') }.to \
        raise_error(Lemonway::Errors::RegisterWalletParameterError)
    end
  end

  describe '#update' do
    it 'raises the update error if parameter is not a hash' do
      expect { described_class.update('wallet_id') }.to \
        raise_error(Lemonway::Errors::UpdateWalletParameterError)
    end

    it 'raises the update error if parameter wallet is not present' do
      expect { described_class.update(test: 'Lemonway') }.to \
        raise_error(Lemonway::Errors::UpdateWalletParameterError)
    end
  end

  describe '#update_status' do
    it 'raises the update_status error if parameter is not a hash' do
      expect { described_class.update_status('wallet_id') }.to \
        raise_error(Lemonway::Errors::UpdateWalletStatusParameterError)
    end

    it 'raises the update_status error if parameter wallet is not present' do
      expect { described_class.update_status(test: 'Lemonway') }.to \
        raise_error(Lemonway::Errors::UpdateWalletStatusParameterError)
    end
  end

  describe '#upload_file' do
    it 'raises the upload_file error if parameter is not a hash' do
      expect { described_class.upload_file('wallet_id') }.to \
        raise_error(Lemonway::Errors::UploadFileParameterError)
    end
  end
end