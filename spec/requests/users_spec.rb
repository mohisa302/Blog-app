require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to be_successful
    end

    it 'renders successfully' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'has a correct status' do
      get users_path
      expect(response.status).to eq(200)
    end
    it 'renders correct view' do
      get users_path
      expect(response.body).to include('Blogapp')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'John Doe', posts_counter: 0) }

    it 'returns a successful response' do
      get user_path(user)
      expect(response).to be_successful
    end

    it 'renders successfully' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'has a correct status' do
      get user_path(user)
      expect(response.status).to eq(200)
    end

    it 'renders correct view' do
      get user_path(user)
      expect(response.body).to include('Bio')
    end
  end
end
