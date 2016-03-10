class CreateLandlords < ActiveRecord::Migration
  def change
    create_table :landlords do |t|
      t.string :first_name
      t.string :last_name
      t.string :business
      t.string :email
      t.string :password
      t.string :phone

      t.timestamps null: false
    end
  end
end
