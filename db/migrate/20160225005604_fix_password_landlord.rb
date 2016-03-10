class FixPasswordLandlord < ActiveRecord::Migration
  def change
  	remove_column :landlords, :password, :string
  	add_column :landlords, :password_digest, :string
  end
end
