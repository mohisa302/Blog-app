class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, inverse_of: 'post', dependent: :destroy
  has_many :comments, inverse_of: 'post', dependent: :destroy

  after_save -> { author.increment!(:posts_counter) }

  def recent_comments
    comments.limit(5).order(created_at: :desc)
  end
end
