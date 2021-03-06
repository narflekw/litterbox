class Show < ActiveRecord::Base
  belongs_to :owner, :class_name=>'DjProfile'
  has_many :broadcasts
  has_many :completed_broadcasts, :class_name=>'Broadcast', :conditions=>{:completed=>true}
  has_many :log_entries, :through=>:completed_broadcasts
  has_many :playlist_items, :through=>:completed_broadcasts
  has_many :time_slots, :as=>:scheduled
  has_many :guests

  validates_presence_of :name, :description, :owner_id
  validates_uniqueness_of :name

  #TODO: on delete give time_slots to "Open Shift"

end
