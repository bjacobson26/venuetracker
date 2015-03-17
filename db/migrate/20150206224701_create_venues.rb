class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :city
      t.decimal :latitude
      t.decimal :longitude
      t.string :address
      t.string :phone
      t.string :description

      t.timestamps
    end
  end
end
