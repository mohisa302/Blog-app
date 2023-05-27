class Post < ApplicationRecord
  before_destroy :decrease_counter
  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, inverse_of: 'post', dependent: :destroy
  has_many :comments, inverse_of: 'post', dependent: :destroy

  after_save -> { author.increment!(:posts_counter) }
  before_destroy :decrease_counter

  def update_counter
    author.increment!(:posts_counter)
  end

  def decrease_counter
    author.decrement!(:posts_counter)
  end

  def recent_comments()
    comments.limit(5).order(created_at: :desc)
  end
end
