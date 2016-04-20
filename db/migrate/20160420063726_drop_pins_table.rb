class DropPinsTable < ActiveRecord::Migration
  def change
  	drop_table :pins
  end
end
