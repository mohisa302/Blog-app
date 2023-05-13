require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    let(:user) { User.create(name: 'John Doe', posts_counter: 0) }
    let(:post) { user.posts.create(title: 'Post 1', text: 'Text 1', comments_counter: 10, author_id: 1, likes_counter: 1) }

    it 'returns a successful response' do
      get user_posts_path(user)
      expect(response).to be_successful
    end

    it 'renders the correct template' do
      get user_posts_path(user)
      expect(response).to render_template(:index)
    end

    it 'has a correct status' do
      get user_posts_path(user)
      expect(response.status).to eq(200)
    end

    it 'displays the correct content' do
      get user_posts_path(user)
      expect(response.body).to include('Here is the list of all posts for user A')
    end
  end

  describe 'GET #show' do
    let(:user) { User.create(name: 'John Doe', posts_counter: 0) }
    let(:post) { user.posts.create(title: 'Post 1', text: 'Text 1', comments_counter: 10, author_id: 1, likes_counter: 1) }

    it 'returns a successful response' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response).to be_successful
    end

    it 'assigns the correct user and post' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(assigns(:user)).to eq(user)
      expect(assigns(:post)).to eq(post)
    end

    it 'has a correct status' do
      get user_post_path(user_id: user.id, id: post.id)
      expect(response.status).to eq(200)
    end
  end
end
