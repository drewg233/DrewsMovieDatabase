class AddHoursMinutes < ActiveRecord::Migration
  def change
  	remove_column :movies, :length
  	add_column :movies, :hour, :integer
  	add_column :movies, :minues, :integer
  end
end
