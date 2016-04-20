class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
    	t.string :name
    end
  end
end
