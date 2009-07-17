class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.string :name
      t.string :guest_type
      t.string :description
      t.integer :show_id
      t.datetime :appear_on

      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
