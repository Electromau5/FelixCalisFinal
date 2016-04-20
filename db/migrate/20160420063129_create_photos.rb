class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
    	t.string :name
    	t.timestamps
    	t.attachment :image
    end
  end
end
