class AddAuthorToComments < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :author, :bigint, null: false
    add_foreign_key :comments, :users, column: :author
  end
end
