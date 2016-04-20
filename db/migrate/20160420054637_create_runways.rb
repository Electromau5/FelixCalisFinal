class CreateRunways < ActiveRecord::Migration
  def change
    create_table :runways do |t|
    	t.string :name
    	t.timestamps
    	t.attachment :image
	end
  end
end
