class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :neighborhood
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :price
      t.string :type
      t.text :description
      t.boolean :pet_friendly
      t.boolean :hot_tub
      t.boolean :pool
      t.boolean :paid_utils
      t.integer :baths
      t.integer :half_baths
      t.integer :beds
      t.boolean :wheelchair_accessible
      t.string :application_path
      t.references :tenant, index: true, foreign_key: true
      t.references :landlord, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
