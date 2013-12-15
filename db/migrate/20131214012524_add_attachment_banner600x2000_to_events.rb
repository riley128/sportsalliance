class AddAttachmentBanner600x2000ToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :banner600x2000
    end
  end

  def self.down
    drop_attached_file :events, :banner600x2000
  end
end
