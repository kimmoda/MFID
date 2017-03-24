class AddAttachmentImageToFits < ActiveRecord::Migration
  def self.up
    change_table :fits do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :fits, :image
  end
end
