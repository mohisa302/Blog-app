class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id # table with foreign key
  belongs_to :post, class_name: 'Post', foreign_key: :post_id # table with foreign key
  after_save -> { post.increment!(:comments_counter) }
  before_destroy :decrease_counter
  def decrease_counter
    post.decrement!(:comments_counter)
  end
end
