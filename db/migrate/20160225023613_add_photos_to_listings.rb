class AddPhotosToListings < ActiveRecord::Migration
  def change
    add_column :listings, :avatars, :json
  end
end
