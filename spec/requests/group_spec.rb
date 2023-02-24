require 'rails_helper'

RSpec.describe Group, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'Amre', email: 'amre@gmail.com', password: 'amre12',
                        password_confirmation: 'amre12')
    @group = Group.create(name: 'Food', icon: 'kasha.jpg', user_id: @user.id)
  end

  describe 'GET /index' do
    before :each do
      sign_in @user
      get user_groups_path(@user.id)
    end

    it 'returns a successful status' do
      expect(response).to have_http_status(200)
    end

    it 'render exact text on page' do
      expect(response.body).to include('Food')
    end
  end
end
