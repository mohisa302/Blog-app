class AddPostsCountToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_count, :integer
    add_index :users, :posts_count
  end
end
