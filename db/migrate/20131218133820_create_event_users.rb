class CreateEventUsers < ActiveRecord::Migration
  def change
    create_table :event_users do |t|
      t.integer :event_id
      t.integer :uid
      t.string :event_name
      t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :is_admin
      t.boolean :is_host
      t.boolean :is_guest
      t.string :stripe_card_token

      t.timestamps
    end
  end
end
