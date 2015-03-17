class AddVidToEvents < ActiveRecord::Migration
  def change
    add_column :events, :vid, :integer
  end
end
