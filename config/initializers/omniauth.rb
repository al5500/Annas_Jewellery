Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1453665291605840', 'a2ff0e17f9e23cbc96c276c61443d4e8'
  provider :google_oauth2, "429459877529-cts214edtqarkiungu1hsqf9u3pdggk2.apps.googleusercontent.com", "Q5-Yx8ic_0q_dznN0QmZ8xz_"
  provider :twitter, "E3Ml2WwCXUHcUFA97fUMyCeum", "CGuGBDdzWvfaQ0IRkYVvrnCFZsfGTkCKHr4cpVEmif00UDJLWu"
end