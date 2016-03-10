class Tenant < ActiveRecord::Base
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
