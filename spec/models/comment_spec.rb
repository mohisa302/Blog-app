require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(name: 'Jane', photo: 'https://t3.ftcdn.net/jpg/02/47/40/98/360_F_247409832_pPugfgU5cKLsrH5OCJRMn5JTcy2L1Rrg.jpg', bio: 'Anything', posts_counter: 0) }
  let(:post) { Post.create(title: 'Test Post', text: 'Lorem ipsum', comments_counter: 0, likes_counter: 0, author_id: user.id) }

  describe "callbacks" do
    it "increments the post's comment counter after a new comment is created" do
      expect {
        Comment.create(author_id: user.id, post_id: post.id)
      }.to change { post.reload.comments_counter }.from(0).to(1)
    end
  end
end
