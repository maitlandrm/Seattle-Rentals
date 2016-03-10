class RemoveTypeFromListing < ActiveRecord::Migration
  def change
  	remove_column :listings, :type, :string
  	add_column :listings, :category, :string

  end
end
