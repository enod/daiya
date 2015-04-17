class CreateReceivers < ActiveRecord::Migration
  def change
    create_table :receivers do |t|
      t.string :stuff
      t.text :description
      t.string :source_address
      t.string :destination_address
      t.date :from
      t.date :to
      t.string :phone
      t.string :mail
      t.string :fee
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
