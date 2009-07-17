class CreateLogEntries < ActiveRecord::Migration
  def self.up
    create_table :log_entries do |t|
      t.integer :broadcast_id
      t.integer :logged_id
      t.string :logged_type
      t.float :timecode

      t.timestamps
    end
  end

  def self.down
    drop_table :log_entries
  end
end
