class AddCheckInCountToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :check_ins_count, :integer
  end
end
