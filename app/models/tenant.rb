class Tenant < ActiveRecord::Base
	has_many :favorites, dependent: :destroy
	has_many :listings, through: :favorites
	PHONE_REGEX = /\(?([0-9]{3})\)?([ .-]?)([0-9]{3})\2([0-9]{4})/
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :phone, presence: :true, format: {with: PHONE_REGEX}, :length => {:minimum => 10, :maximum => 15}, on: :create
	validates :first_name, :last_name, presence: :true, on: :create
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  validates :password, presence: true, on: :update, allow_blank: true
  has_secure_password

  def self.check_session user
		valid_user = Tenant.find_by(email: user['email'])
		if valid_user && valid_user.authenticate(user["password"])
			return {"status": true, "id": valid_user.id}
		else
			return false
		end
	end
end
