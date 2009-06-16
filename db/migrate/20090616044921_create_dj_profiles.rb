class CreateDjProfiles < ActiveRecord::Migration
  def self.up
    create_table :dj_profiles do |t|
      t.string :name
      t.string :email
      t.string :twitter_id
      t.string :facebook_url
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :dj_profiles
  end
end
