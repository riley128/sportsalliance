class AddAttachmentBanner1200x2000ToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :banner1200x2000
    end
  end

  def self.down
    drop_attached_file :events, :banner1200x2000
  end
end
