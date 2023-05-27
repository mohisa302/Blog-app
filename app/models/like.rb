class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id # table with foreign key
  belongs_to :post, class_name: 'Post', foreign_key: :post_id # table with foreign key
  after_save -> { post.increment!(:likes_counter) }
end
