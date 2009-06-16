class CreatePlaylistItems < ActiveRecord::Migration
  def self.up
    create_table :playlist_items do |t|
      t.integer :broadcast_id, :null=>false
      t.integer :item_id, :null=>false
      t.string :item_type, :null=>false
      t.integer :list_position
      t.boolean :new, :live

      t.timestamps
    end
  end

  def self.down
    drop_table :playlist_items
  end
end
