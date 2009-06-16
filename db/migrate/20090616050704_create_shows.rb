class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.string :name
      t.integer :owner_id
      t.text :description
      t.string :logo_file
      t.string :logo_location

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
