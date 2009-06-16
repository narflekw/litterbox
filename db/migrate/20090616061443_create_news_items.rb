class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :headline
      t.string :link
      t.text :note

      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
