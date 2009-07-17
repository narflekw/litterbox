class Broadcast < ActiveRecord::Base
  belongs_to :show
  has_many :broadcast_presences
  has_many :on_air_djs, :class_name=>'DjProfile', :through=>:broadcast_presences
  has_many :playlist_items
  has_many :log_entries
end
