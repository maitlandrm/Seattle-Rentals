class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :path
      t.text :caption
      t.references :listing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
