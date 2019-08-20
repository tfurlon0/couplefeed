class AddCommentCountToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :comments_count, :integer
  end
end
