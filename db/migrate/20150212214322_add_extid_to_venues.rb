class AddExtidToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :ext_id, :integer
  end
end
