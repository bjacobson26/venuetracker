class RemoveVenueExtIdFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :venue_ext_id, :integer
  end
end
