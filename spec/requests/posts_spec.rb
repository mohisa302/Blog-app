require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET #index" do
    let(:user) { User.create(name: "John Doe", posts_counter: 0) }
    let(:post) { user.posts.create(title: 'Post 1', text: 'Text 1', comments_counter: 10, author_id: 1, likes_counter: 1) }
    it "returns a successful response" do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to be_successful
    end

    it "renders successfully" do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to render_template(:index)
    end

    it "has a correct status" do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response.status).to eq(200)
    end
    it "renders correct view" do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response.body).to include('Here is the list of all posts for user A')
    end
  end
end
