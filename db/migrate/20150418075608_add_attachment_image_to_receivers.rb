class AddAttachmentImageToReceivers < ActiveRecord::Migration
  def self.up
    change_table :receivers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :receivers, :image
  end
end
