class Landlord < ActiveRecord::Base
	has_many :listings, dependent: :destroy
	has_secure_password
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email, :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, on: :update, allow_blank: true
	
	def self.check_session user
		valid_user = Landlord.find_by(email: user['email'])
		if valid_user && valid_user.authenticate(user["password"])
			return {"status": true, "id": valid_user.id}
		else
			return false
		end
	end

end
