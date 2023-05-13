require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET #index" do
    it "returns a successful response" do
      get users_path
      expect(response).to be_successful
    end

    it "renders successfully" do
      get users_path
      expect(response).to render_template(:index)
    end

    it "has a correct status" do
      get users_path
      expect(response.status).to eq(200)
    end
    it "renders correct view" do
      get users_path
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe "GET #show" do
    let(:user) { User.create(name: "John Doe") }

    it "returns a successful response" do
      user.save
      get user_path(user)
      expect(response).to be_successful
    end
  end
  # describe "GET #show" do
  #   let(:user) { User.create(name: "John Doe") }
  #   let(:post) { user.posts.create(title: "Post title", body: "Post body") }

  #   it "returns a successful response" do
  #     get :show, params: { id: user.id }
  #     expect(response).to be_successful
  #   end
    
  #   it "assigns the correct user and posts" do
  #     get :show, params: { id: user.id }
  #     expect(assigns(:user)).to eq(user)
  #     expect(assigns(:posts)).to eq([post])
  #   end
  # end

end
