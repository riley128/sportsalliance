class CreateCheckout < ActiveRecord::Migration
  def change
    create_table :checkouts do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :stripe_card_token
      t.string :user_id
      t.string :event_id
    end
  end
end
