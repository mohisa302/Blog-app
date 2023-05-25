class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  validates :posts_counter, numericality: { greater_than_or_equal_to: 0, only_integer: true }

  has_many :posts, foreign_key: 'author_id', inverse_of: :author, dependent: :destroy
  has_many :likes, foreign_key: 'author_id', inverse_of: :author, dependent: :destroy
  has_many :comments, foreign_key: 'author_id', inverse_of: :author, dependent: :destroy

  def recent_posts()
    posts.order(created_at: :desc).limit(3)
  end
end
