class AddSlugToReceivers < ActiveRecord::Migration
  def change
    add_column :receivers, :slug, :string
    add_index :receivers, :slug, unique: true
  end
end
