require 'rails_helper'
RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(name: 'Malik', photo: 'https://unsplash.com/photos/g1oT9KdjAdc', bio: 'Developer from SA.',
                        posts_counter: 0)
  end

  context 'validation' do
    it 'checks title presence' do
      post = Post.new(author: @user, text: 'This is my first post', likes_counter: 0,
                      comments_counter: 0)
      expect(post.valid?).to eq false
    end
    it 'check title length' do
      test_title = 'A' * 260
      post = Post.new(author: @user, title: test_title, text: 'This is my first post', likes_counter: 0,
                      comments_counter: 0)
      expect(post.valid?).to eq false
    end
    it 'checks if likes_counter is an integer' do
      post = Post.new(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: 1.7,
                      comments_counter: 0)
      expect(post.valid?).to eq false
    end

    it 'checks if comments_counter is an integer' do
      post = Post.new(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: 0,
                      comments_counter: 1.8)
      expect(post.valid?).to eq false
    end
    it 'checks if likes_counter is greater or equal to zero' do
      post = Post.new(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: -1,
                      comments_counter: 0)
      expect(post.valid?).to eq false
    end
    it 'checks if comments_counter is greater or equal to zero' do
      post = Post.new(author: @user, title: 'Post communication', text: 'This is my first post', likes_counter: 0,
                      comments_counter: -1)
      expect(post.valid?).to eq false
    end
  end

  context 'Associations' do
    it 'belongs to author' do
      post = Post.reflect_on_association('author')
      expect(post.macro).to eq(:belongs_to)
    end

    it 'has many comments' do
      post = Post.reflect_on_association('comments')
      expect(post.macro).to eq(:has_many)
    end
    it 'has many likes' do
      post = Post.reflect_on_association('likes')
      expect(post.macro).to eq(:has_many)
    end
  end

  context 'custom methods' do
    it 'returns recents comments' do
      test_post = Post.create(author: @user, title: 'my post', text: 'this is my test post', likes_counter: 0,
                              comments_counter: 0)
      10.times { Comment.create(post: test_post, author: @user, text: 'Hi Tom!') }
      expect(test_post.return_recent_comments).to match_array(test_post.comments.last(5))
    end
    it 'updates posts_counter' do
      Post.create(author: @user, title: 'my Post', text: 'This is my test post', likes_counter: 0,
                  comments_counter: 0)
      expect(@user.posts_counter).to eq 2
    end
  end
end
