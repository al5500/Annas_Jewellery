Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1453665291605840', 'a2ff0e17f9e23cbc96c276c61443d4e8'
end