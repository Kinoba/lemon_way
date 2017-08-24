# frozen_string_literal: true

describe LemonWay::Helpers::Forms do
  before { set_lemonway_configuration(company: 'MPA') }

  describe '#lemon_way_money_in_url' do
    subject(:lemon_way_money_in_url) { Helper.new.lemon_way_money_in_url('ABC') }

    it 'returns the url with the company name' do
      expect(lemon_way_money_in_url).to include('MPA')
    end

    it 'returns the url with the env' do
      expect(lemon_way_money_in_url).to include('dev')
    end

    it 'returns the url with the token' do
      expect(lemon_way_money_in_url).to include('?moneyintoken=ABC')
    end
  end
end
