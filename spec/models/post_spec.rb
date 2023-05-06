require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { User.create(name: 'Jane', photo: 'https://t3.ftcdn.net/jpg/02/47/40/98/360_F_247409832_pPugfgU5cKLsrH5OCJRMn5JTcy2L1Rrg.jpg', bio: 'Anything', posts_counter: 0) }
  
  describe "creating a new post" do
    it "updates the author's posts counter after saving a new post" do
      post = Post.new(title: 'Post 1', text: 'Text 1', comments_counter: 10, author_id: 1, likes_counter: 10)
      post.save
      
      expect do
        Post.create(title: 'Test Post', text: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author_id: user.id)
      end.to(change { user.reload.posts_counter }.from(0).to(1))
    end
  end

  describe 'validation of title' do
    subject { Post.new(title: 'Post 1', text: 'Text 1', comments_counter: 10, author_id: 1, likes_counter: 10) }
    
    it 'presentation of title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end
    
    it 'length of title' do
      subject.title = 'm' * 258
      expect(subject).to_not be_valid
    end
  end

  describe 'validates of comments_counter' do
    subject { Post.new(title: 'Post 1', text: 'Text 1', comments_counter: 10, author_id: 1, likes_counter: 10) }
    
    it 'numericality of comments_counter' do
      subject.comments_counter = 'string'
      expect(subject).to_not be_valid
   
      subject.comments_counter = -1
     expect(subject).to_not be_valid
    end
  end

  describe 'validates of likes_counter' do
    subject { Post.new(title: 'Post 1', text: 'Text 1', comments_counter: 10, author_id: 1, likes_counter: 10) }
    
    it 'umericality of likes_counter' do
      subject.likes_counter = 'string'
      expect(subject).to_not be_valid

      subject.likes_counter = -1
      expect(subject).to_not be_valid
    end
  end

  describe 'recent_comments method' do
    let(:post) { 
      post = Post.create(title: 'Test Post', text: 'Lorem ipsum', comments_counter: 2, likes_counter: 0, author_id: user.id)
      comment1 = post.comments.create(author_id: user.id, text: 'Comment 1')
      comment2 = post.comments.create(author_id: user.id, text: 'Comment 2')
      comment3 = post.comments.create(author_id: user.id, text: 'Comment 3')
      post
    }

    it 'returns up to 5 recent comments for the post' do
      expect(post.recent_comments).to eq [post.comments[2], post.comments[1], post.comments[0]]
    end
    
    it 'returns less than or equal to 5 comments if there are fewer than 5 comments for the post' do
      post.comments[0].destroy
      post.comments[1].destroy
          
      expect(post.recent_comments.to_a).to eq [post.comments.last]
    end
    
    it 'returns an empty array if there are no comments for the post' do
      post.comments.destroy_all
      
      expect(post.recent_comments).to eq []
    end
  end
end
