class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :receiver_id
      t.integer :user_id
      t.text :content

      t.timestamps null: false
    end
  end
end
