class AddPhotoCountToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :photos_count, :integer
  end
end
