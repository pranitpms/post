class RemoveImage < ActiveRecord::Migration
  def up
  	remove_column :users, :photo_file_size, :photo_updated_at
  end

  def down
  end
end
