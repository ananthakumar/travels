Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_UEBmC9eFuHpQenaZeSjXiDqv'],
  :secret_key      => ENV['sk_test_UGpFXglt3UrmW99O8WGN28Ir']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]