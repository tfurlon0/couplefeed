class AddCheckInCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :check_ins_count, :integer
  end
end
