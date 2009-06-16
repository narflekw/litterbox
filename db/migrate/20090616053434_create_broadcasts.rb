class CreateBroadcasts < ActiveRecord::Migration
  def self.up
    create_table :broadcasts do |t|
      t.datetime :start_at
      t.datetime :end_at
      t.integer :duration_seconds
      t.string :podcast
      t.boolean :completed

      t.timestamps
    end
    create_table :broadcasts_dj_profiles, :id=>false do |t|
      t.integer :broadcast_id
      t.integer :dj_profile_id
    end
  end

  def self.down
    drop_table :broadcasts_dj_profiles
    drop_table :broadcasts
  end
end
