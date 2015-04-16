class CreateNegotiations < ActiveRecord::Migration
  def change
    create_table :negotiations do |t|
      t.integer :sender_id
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
