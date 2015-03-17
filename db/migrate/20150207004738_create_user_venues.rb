class CreateUserVenues < ActiveRecord::Migration
  def change
    create_table :user_venues do |t|
      t.belongs_to :user, index: true
      t.belongs_to :venue, index: true

      t.timestamps
    end
  end
end
