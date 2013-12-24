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


    end
  end

  class StripePaymentCharger
    extend PaymentCharger
    def self.apply_charges(amt, opts)
      Stripe::Charge.create(
      :amount => amt,
      :currency => opts[:currency],
      :card => opts[:stripe_card_token], # obtained with Stripe.js
      :description => "Charge for test@example.com"
    )


    end
  end
end