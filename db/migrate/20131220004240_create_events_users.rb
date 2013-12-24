class CreateEventsUsers < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
    	t.integer :event_id
        t.integer :user_id
        t.boolean :is_admin
        t.boolean :is_host
        t.boolean :is_guest
        t.timestamps
    end
    add_index :events_users, [:event_id,:user_id]
  end
end
