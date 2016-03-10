OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
		provider :facebook, 1523770997925133, "9c20595ff08592c89baaefc9abe65047"

		provider :google_oauth2, "525318693705-lqvterlok3236e82coqj6laqjp7d5iqg.apps.googleusercontent.com",  "MnnEASErzfYa7Du8Cvns7r1L",
		:client_options => {:ssl => {:verify => false}},
		scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online'

end

# 
