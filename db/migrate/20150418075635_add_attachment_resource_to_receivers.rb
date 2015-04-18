class AddAttachmentResourceToReceivers < ActiveRecord::Migration
  def self.up
    change_table :receivers do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :receivers, :resource
  end
end
