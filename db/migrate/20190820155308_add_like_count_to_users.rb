class AddLikeCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :likes_count, :integer
  end
end
