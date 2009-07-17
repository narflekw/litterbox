class NewsItem < ActiveRecord::Base
  has_many :playlist_items, :as=>:item
  has_many :log_entries, :as=>:logged
end
