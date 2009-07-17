class CreateTimeSlots < ActiveRecord::Migration
  def self.up
    create_table :time_slots do |t|
      t.integer :scheduled_id
      t.string :scheduled_type
      t.string :weekday
      t.time :start_at
      t.integer :duration_minutes

      t.timestamps
    end
  end

  def self.down
    drop_table :time_slots
  end
end
