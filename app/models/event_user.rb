class EventUser < ActiveRecord::Base
	attr_accessible :stripe_card_token, :event_users,  :event_id, :uid, :event_name, :email, :first_name, :last_name, :is_admin, :is_host, :is_guest


	def save_with_payment
	  if valid?
	  	Stripe::Charge.create(
		  :amount => 400,
		  :currency => "usd",
		  :card => stripe_card_token, # obtained with Stripe.js
		  :description => "Charge for test@example.com"
		)
	    
	    save!
	  end
	rescue Stripe::InvalidRequestError => e
	  logger.error "Stripe error while creating customer: #{e.message}"
	  errors.add :base, "There was a problem with your credit card."
	  false
	end

end
