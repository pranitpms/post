class RemoveImage < ActiveRecord::Migration
  def up
  	remove_column :users, :image
  end

  def down
  end
end
