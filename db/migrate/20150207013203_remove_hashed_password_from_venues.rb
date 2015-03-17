class RemoveHashedPasswordFromVenues < ActiveRecord::Migration
  def change
    remove_column :venues, :hashed_password, :string
  end
end
