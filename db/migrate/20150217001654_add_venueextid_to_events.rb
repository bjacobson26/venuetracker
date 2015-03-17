class AddVenueextidToEvents < ActiveRecord::Migration
  def change
    add_column :events, :venue_ext_id, :integer
  end
end
