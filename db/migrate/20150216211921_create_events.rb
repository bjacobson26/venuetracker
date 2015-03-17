class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.time :time
      t.datetime :datetime
      t.string :artist
      t.string :uri

      t.timestamps
    end
  end
end
