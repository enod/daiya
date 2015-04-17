class AddMapToReceivers < ActiveRecord::Migration
  def change
    add_column :receivers, :latitude1, :float
    add_column :receivers, :longitude1, :float
    add_column :receivers, :latitude2, :float
    add_column :receivers, :longitude2, :float
  end
end
