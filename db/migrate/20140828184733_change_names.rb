class ChangeNames < ActiveRecord::Migration
  def change
  	rename_column :movies, :hour, :hours
  	rename_column :movies, :minues, :minutes
  end
end
