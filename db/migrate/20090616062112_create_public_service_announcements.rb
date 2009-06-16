class CreatePublicServiceAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :public_service_announcements do |t|
      t.string :psa_type
      t.text :message
      t.date :start_on
      t.date :end_on

      t.timestamps
    end
  end

  def self.down
    drop_table :public_service_announcements
  end
end
