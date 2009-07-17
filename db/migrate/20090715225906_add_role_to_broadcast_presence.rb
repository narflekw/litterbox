class AddRoleToBroadcastPresence < ActiveRecord::Migration
  def self.up
    add_column :broadcast_presences, :role, :string, :default=>'unassigned'
  end

  def self.down
    remove_column :broadcast_presences, :role
  end
end
