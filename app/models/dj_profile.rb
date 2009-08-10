class DjProfile < ActiveRecord::Base
  belongs_to :user
  has_many :shows, :foreign_key=>'owner_id'
  has_many :broadcast_presences
  has_many :broadcasts, :through=>:broadcast_presences

  validates_presence_of :name
  validates_uniqueness_of :name, :email
end
