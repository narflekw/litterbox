class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :event_type_id
      t.integer :location_id
      t.string :title
      t.text :description
      t.datetime :start_at
      t.datetime :end_at

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
