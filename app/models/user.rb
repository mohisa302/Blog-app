class User < ApplicationRecord
  validates :name, presence: true
  validates :posts_counter,  numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  has_many :posts, inverse_of: :author, dependent: :destroy
  has_many :likes, inverse_of: :author, dependent: :destroy
  has_many :comments, inverse_of: :author, dependent: :destroy

  def recent_posts()
    posts.order(created_at: :desc).limit(3)
  end
end
