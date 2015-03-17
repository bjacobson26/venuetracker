class AddHashedPasswordToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :hashed_password, :string
  end
end
