class DjProfile < ActiveRecord::Base
  belongs_to :user
  has_one :show
  has_many :broadcast_presences
  has_many :broadcasts, :through=>:broadcast_presences
end
