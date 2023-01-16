# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  before { create(:user, :with_5_news) }

  subject(:parsed_json) { JSON.parse(response.body) }

  describe 'GET index' do
    it 'Returns a 200' do
      get(:index)

      expect(response).to have_http_status(200)
    end

    it 'Returns number of news (5)' do
      get(:index)

      expect(JSON.parse(response.body).count).to eq(5)
    end
  end

  describe 'GET show_user_news' do
    it 'Returns number of author news (5)' do
      get(:show_user_news, format: :json, params: { user_id: User.first.id })

      expect(parsed_json.count).to eq(5)
    end
  end

  describe 'GET show' do
    it 'Return specific news' do
      get(:show, format: :json, params: { id: News.first[:id] })

      is_expected.to include(News.first.attributes.except('picture', 'created_at', 'updated_at'))
    end
  end
end
