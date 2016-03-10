class User < ActiveRecord::Base

		def self.from_omniauth(auth_hash)
			user = find_by(uid: auth_hash['uid'], provider: auth_hash['provider'])
			if !user
				user = User.create(uid: auth_hash['uid'], provider: auth_hash['provider'], name: auth_hash['info']['name'], image_url: auth_hash['info']['image'], url: auth_hash['info']['email'])
			end
			user
		end
end
