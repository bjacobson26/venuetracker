class AddExtIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :ext_id, :integer
  end
end
