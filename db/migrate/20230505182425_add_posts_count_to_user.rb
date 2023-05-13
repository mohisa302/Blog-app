class AddPostsCountToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :posts_counter, :integer
    add_index :users, :posts_counter
  end
end
