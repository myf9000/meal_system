Rails.application.config.middleware.use OmniAuth::Builder do
  #provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'], scope: 'public_profile', info_fields: 'id,name'
  #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET'], scope: "user"
  provider :facebook, "1689563364625349", "35d381b383f5136e4549dcf768a75dc3", scope: 'public_profile', info_fields: 'id,name'
  provider :github, "38d66033333bfd9e3209", "367ef82e3e2993d348f20c836daedad5b67ef48d", scope: "user"

end