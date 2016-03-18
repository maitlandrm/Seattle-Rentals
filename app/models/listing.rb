class Listing < ActiveRecord::Base
  belongs_to :tenant
  belongs_to :landlord
  has_many :favorites, dependent: :destroy
  mount_uploaders :avatars, AvatarUploader
end
