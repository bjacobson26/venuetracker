class RemoveVidFromEvents < ActiveRecord::Migration
  def change
    remove_column :events, :vid, :integer
  end
end
