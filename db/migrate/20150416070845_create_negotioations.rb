class CreateNegotioations < ActiveRecord::Migration
  def change
    create_table :negotioations do |t|
      t.integer :place_id
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
