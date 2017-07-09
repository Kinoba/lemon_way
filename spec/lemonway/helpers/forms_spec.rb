# frozen_string_literal: true

describe LemonWay::Helpers::Forms do
  before { set_lemonway_configuration(company: 'MPA') }

  describe '#lemon_way_form_url' do
    subject(:lemon_way_form_url) { Helper.new.lemon_way_form_url('ABC') }

    it 'returns the url with the company name' do
      expect(lemon_way_form_url).to include('MPA')
    end

    it 'returns the url with the env' do
      expect(lemon_way_form_url).to include('dev')
    end

    it 'returns the url with the form id' do
      expect(lemon_way_form_url).to include('/payment-page/?fId=ABC')
    end
  end
end
