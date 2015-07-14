Rails.configuration.stripe = {
  :publishable_key => Rails.application.secrets.stripe_pk,
  :secret_key      => Rails.application.secrets.stripe_sk
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
