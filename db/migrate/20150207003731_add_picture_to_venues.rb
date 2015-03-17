class AddPictureToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :picture, :string
  end
end
