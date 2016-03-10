class AddMainPhotoToListings < ActiveRecord::Migration
  def change
  	add_column :listings, :main, :string
  end
end
