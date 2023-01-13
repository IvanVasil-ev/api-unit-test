# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  before { create(:user, :with_5_news) }

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
    it 'Returns number of user news (5)' do
      get(:show_user_news, format: :json, params: { user_id: User.first.id })

      expect(JSON.parse(response.body).count).to eq(5)
    end
  end
end
