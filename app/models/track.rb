class Track < ActiveRecord::Base
  has_many :playlist_items, :as=>:item
end
