class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User' # table with foreign key
  belongs_to :post, class_name: 'Post' # table with foreign key
  after_save -> { post.increment!(:comments_counter) }
end