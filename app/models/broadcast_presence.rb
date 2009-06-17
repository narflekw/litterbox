class BroadcastPresence < ActiveRecord::Base
  belongs_to :broadcast
  belongs_to :dj_profile
end
