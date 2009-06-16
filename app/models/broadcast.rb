class Broadcast < ActiveRecord::Base
  belongs_to :show
  has_and_belongs_to_many :on_air_djs, :class_name=>'DjProfile'
  has_many :playlist_items
end
