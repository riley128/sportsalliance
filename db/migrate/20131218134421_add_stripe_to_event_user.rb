class AddStripeToEventUser < ActiveRecord::Migration
  def change
    add_column :event_users, :stripe_customer_token, :string
  end
end
