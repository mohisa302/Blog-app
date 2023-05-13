require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET #index" do
    it "returns a successful response" do
      get posts_path
      expect(response).to be_successful
    end

    it "renders successfully" do
      get posts_path
      expect(response).to render_template(:index)
    end

    it "has a correct status" do
      get posts_path
      expect(response.status).to eq(200)
    end
    it "renders correct view" do
      get posts_path
      expect(response.body).to include('Here is the list of all posts for user A')
    end
  end
end
