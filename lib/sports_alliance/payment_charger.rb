module SportsAlliance
  module PaymentCharger
    CURRENCY_USD = "usd"

    def charge(amt, opts)
      charges_applied = apply_charges(amt, opts)
      record_charges(amt, opts) if charges_applied
      charges_applied
    end

    def apply_charges(amt, opts)
      raise NotImplementedError
    end

    def record_charges(amt, opts)
      # HANDLE CREATING ANY NEW ACTIVE RECORD INSTANCES HERE
    end
  end

  class StripePaymentCharger
    extend PaymentCharger
    def self.apply_charges(amt, opts)
      Stripe::Charge.create(
      :amount => amt,
      :currency => CURRENCY_USD,
      :card => stripe_card_token, # obtained with Stripe.js
      :description => "Charge for test@example.com"
    )

      rescue Stripe::InvalidRequestError => e
        logger.error "Stripe error while creating customer: #{e.message}"
        errors.add :base, "There was a problem with your credit card."
        false
    end
  end
end