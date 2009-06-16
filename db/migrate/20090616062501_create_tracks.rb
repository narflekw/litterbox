class CreateTracks < ActiveRecord::Migration
  def self.up
    create_table :tracks do |t|
      t.string :name
      t.integer :album_id
      t.integer :duration_seconds

      t.timestamps
    end
  end

  def self.down
    drop_table :tracks
  end
end
