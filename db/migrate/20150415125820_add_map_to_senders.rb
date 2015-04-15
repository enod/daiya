class AddMapToSenders < ActiveRecord::Migration
  def change
    add_column :senders, :latitude, :float
    add_column :senders, :longitude, :float
    add_column :senders, :latitude2, :float
    add_column :senders, :longitudde2, :float
  end
end
