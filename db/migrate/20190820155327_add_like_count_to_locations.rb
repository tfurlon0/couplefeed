class AddLikeCountToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :likes_count, :integer
  end
end
