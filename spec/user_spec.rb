require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    it 'checks if name is empty' do
      user = User.new(photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Nice user', posts_counter: 0)
      expect(user.valid?).to eq false
    end

    it 'checks if posts_counter is an integer' do
      user = User.new(name: 'John', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Nice user',
                      posts_counter: 1.5)
      expect(user.valid?).to eq false
    end

    it 'checks if posts_counter is greater or equal to zero' do
      user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Nice user',
                      posts_counter: -1)
      expect(user.valid?).to eq false
    end
  end

  context 'Associations' do
    it 'has many posts' do
      user = User.reflect_on_association('posts')
      expect(user.macro).to eq(:has_many)
    end

    it 'has many comments' do
      user = User.reflect_on_association('comments')
      expect(user.macro).to eq(:has_many)
    end

    it 'has many likes' do
      user = User.reflect_on_association('likes')
      expect(user.macro).to eq(:has_many)
    end
  end

  context 'Custom methods' do
    it 'returns recent posts' do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'developer',
                         posts_counter: 0)
      7.times { Post.create(author: user, title: 'Hello', text: 'This is my first post') }
      expect(user.recent_posts).to eq user.posts.last(3)
    end
  end
end
