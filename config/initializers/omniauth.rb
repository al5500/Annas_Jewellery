Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1453185518320484', '2cad864d40daf125834b60d92d4abbc6'
end