class Show < ActiveRecord::Base
  belongs_to :dj_profile
  has_many :completed_broadcasts, :class_name=>'Broadcast'
  has_many :scheduled_broadcasts, :class_name=>'Broadcast'

end
