class CreateSenders < ActiveRecord::Migration
  def change
    create_table :senders do |t|
      t.string :source_address
      t.string :destination_address
      t.text :description
      t.date :arrival
      t.string :phone
      t.string :mail
      t.string :fee
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
