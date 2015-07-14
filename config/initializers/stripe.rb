Rails.configuration.stripe = {
  :publishable_key => "pk_test_8oJJdPnRkRlhQknBMMsGTWSb",
  :secret_key      => "sk_test_8FIecEYn7phafguK2sFgkols"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
