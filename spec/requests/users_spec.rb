require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    it "renders the index template" do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is a list of all users')
    end
  end
end
