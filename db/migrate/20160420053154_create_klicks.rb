class CreateKlicks < ActiveRecord::Migration
  def change
    create_table :klicks do |t|
    	t.string :name
    	t.timestamps
    	t.attachment :image
    end
  end
end
