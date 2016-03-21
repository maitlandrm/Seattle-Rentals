OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
		provider :facebook, ENV["facebook_key"], ENV["facebook_secret"]

		provider :google_oauth2, ENV["google_id"],  ENV["google_secret"],
		:client_options => {:ssl => {:verify => false}},
		scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online'

end
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV["google_id"], ENV["google_secret"],
#     {
#       :image_aspect_ratio => "square",
#       :image_size => 50
#     }
# end
# 
