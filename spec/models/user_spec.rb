require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.create!(
      name: 'John',
      photo: 'https://t3.ftcdn.net/jpg/02/47/40/OCJRMn5JTcy2L1Rrg.jpg', 
      bio: 'Anything',
      posts_counter: 5
    )
  }

  before {subject.save }
  let(:user_with_zero_posts) { described_class.new(name: 'Jane', posts_counter: 0) }
 
  describe 'validations' do
    it 'validates presence of name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'validates numericality of posts_counter' do
      subject.posts_counter = 'invalid'
      expect(subject).to_not be_valid

      subject.posts_counter = -1
      expect(subject).to_not be_valid

      subject.posts_counter = 0
      expect(subject).to be_valid
    end
  end

  describe 'recent_posts method' do
    it 'returns an empty array if the user has no posts' do
      expect(user_with_zero_posts.recent_posts).to be_empty
    end

    it 'returns the three most recent posts' do
      old_post = subject.posts.create(
        title: "Post_old",
        text: "Text",
        comments_counter: 10,
        author_id: subject.id,
        likes_counter: 10
      )
      new_post_1 = subject.posts.create(
        title: "Post_new",
         text: "Text",
        comments_counter: 7,
         author_id: subject.id,
        likes_counter: 9
      )
      new_post_2 = subject.posts.create(
        title: "Post_new2",
        text: "Text",
        comments_counter: 10,
        author_id: subject.id,
        likes_counter: 10)
      expect(subject.recent_posts).to eq([new_post_2, new_post_1, old_post])
    end

    it 'returns less than three posts if there are not enough posts' do
      subject.posts.create(
        title: "Post_old",
        text: "Text",
        comments_counter: 10,
        author_id: subject.id,
        likes_counter: 10
      )
  
      expect(subject.recent_posts.count).to eq(1)
    end
    
    it 'returns an empty array if the user has no posts' do
      expect(user_with_zero_posts.recent_posts).to be_empty
    end
  end

end
