# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  let(:parsed_json) { JSON.parse(response.body) }

  before do
    create(:user, :with_5_news)
    create(:user, :with_5_news)
  end

  context 'GET#index' do
    it 'Request is successful' do
      get(:index)

      expect(response).to be_successful
    end

    it 'Returns count of news (10)' do
      get(:index)

      expect(parsed_json.count).to eq(10)
    end
  end

  context 'GET#show_user_news' do
    it 'Returns number of author news (5)' do
      get(:show_user_news, params: { user_id: User.first.id })

      expect(parsed_json.count).to eq(5)
    end
  end

  context 'GET#show' do
    it 'Return specific news' do
      get(:show, params: { id: News.first[:id] })

      expect(response.body).to eq(News.first.to_json)
    end
  end
end
