class AddStarttimeToFriends < ActiveRecord::Migration
  def change
    add_column :friends, :start_time, :datetime
  end
end
