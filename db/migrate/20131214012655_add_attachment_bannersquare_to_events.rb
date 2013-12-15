class AddAttachmentBannersquareToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :bannersquare
    end
  end

  def self.down
    drop_attached_file :events, :bannersquare
  end
end
