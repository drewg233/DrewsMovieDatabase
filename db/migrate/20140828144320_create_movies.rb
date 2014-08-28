class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
    	t.string :title
    	t.string :format
    	t.time :length
    	t.integer :release
    	t.integer :rating

      t.timestamps
    end
  end
end
