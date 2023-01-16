# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before { create(:user) }

  subject(:parsed_json) { JSON.parse(response.body) }

  context 'GET#index' do
    it 'Request is successful' do
      get(:index)

      expect(response).to be_successful
    end

    it 'Returns all users' do
      get(:index)

      expect(response.body).to eq(User.all.to_json)
    end
  end
end
