class CreateBroadcastPresences < ActiveRecord::Migration
  def self.up
    create_table :broadcast_presences do |t|
      t.integer :broadcast_id
      t.integer :dj_profile_id
      t.string  :role # i.e. dj, commentor, guest, producer, etc.

      t.timestamps
    end
  end

  def self.down
    drop_table :broadcast_presences
  end
end
