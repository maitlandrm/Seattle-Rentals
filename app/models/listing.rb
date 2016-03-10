class Listing < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :landlord
  mount_uploaders :avatars, AvatarUploader
end
